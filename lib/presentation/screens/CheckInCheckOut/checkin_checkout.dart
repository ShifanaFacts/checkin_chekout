import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';

import 'widgets/user_info_card.dart';
import 'widgets/time_display.dart';
import 'widgets/dropdown_section.dart';
import 'widgets/checkin_details_card.dart';

enum LocationStatus { loading, insideRadius, outsideRadius, inaccessible }

class CheckinCheckout extends StatefulWidget {
  const CheckinCheckout({super.key});

  @override
  CheckinCheckoutState createState() => CheckinCheckoutState();
}

class CheckinCheckoutState extends State<CheckinCheckout> {
  String currentTime = DateFormat(
    'hh:mm:ss a',
  ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
  String currentDate = DateFormat(
    'EEEE, MMMM d, yyyy',
  ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
  bool isCheckedIn = false;
  String currentStatus = "Not Checked-In";
  String? checkInTime;

  // Dropdown selections
  String? selectedProject,
      selectedDepartment,
      selectedCostCode,
      selectedActivity;

  // Options
  final List<String> projects = ['Project A', 'Project B', 'Project C'];
  final List<String> departments = ['IT', 'HR', 'Finance'];
  final List<String> costCodes = ['CC001', 'CC002', 'CC003'];
  final List<String> activities = ['Development', 'Testing', 'Deployment'];

  // Map and location
  LatLng? currentLocation;
  final LatLng companyLocation = const LatLng(
    25.276987,
    55.296249,
  ); // Placeholder: Dubai, UAE
  final double radius = 10000; // 10km in meters
  final Completer<GoogleMapController> _mapController = Completer();
  LocationStatus locationStatus = LocationStatus.loading;
  double? distance;
  String? currentAddress;
  String? companyAddress;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _checkLocation();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return timer.cancel();
      setState(() {
        currentTime = DateFormat(
          'hh:mm:ss a',
        ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
      });
    });
  }

  Future<void> _checkLocation() async {
    setState(() => locationStatus = LocationStatus.loading);

    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => locationStatus = LocationStatus.inaccessible);
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Brief delay to show message
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/location');
      }
      return;
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => locationStatus = LocationStatus.inaccessible);
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/location');
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() => locationStatus = LocationStatus.inaccessible);
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/location');
      }
      return;
    }

    // Get current position with timeout
    try {
      Position position =
          await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          ).timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw TimeoutException('Location fetch timed out');
            },
          );

      currentLocation = LatLng(position.latitude, position.longitude);

      // Get addresses using reverse geocoding
      try {
        List<Placemark> currentPlacemarks = await placemarkFromCoordinates(
          currentLocation!.latitude,
          currentLocation!.longitude,
        );
        List<Placemark> companyPlacemarks = await placemarkFromCoordinates(
          companyLocation.latitude,
          companyLocation.longitude,
        );

        currentAddress = currentPlacemarks.isNotEmpty
            ? _formatAddress(currentPlacemarks.first)
            : 'Unknown location';
        companyAddress = companyPlacemarks.isNotEmpty
            ? _formatAddress(companyPlacemarks.first)
            : 'Company location';
      } catch (e) {
        currentAddress = 'Unknown location';
        companyAddress = 'Company location';
      }

      // Calculate distance to company location
      double distanceInMeters = Geolocator.distanceBetween(
        currentLocation!.latitude,
        currentLocation!.longitude,
        companyLocation.latitude,
        companyLocation.longitude,
      );

      setState(() {
        distance = distanceInMeters;
        locationStatus = distanceInMeters <= radius
            ? LocationStatus.insideRadius
            : LocationStatus.outsideRadius;
      });
    } catch (e) {
      setState(() {
        locationStatus = LocationStatus.inaccessible;
        errorMessage = e.toString();
      });
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/location');
      }
    }
  }

  String _formatAddress(Placemark placemark) {
    List<String> parts = [
      placemark.name ?? '',
      placemark.street ?? '',
      placemark.locality ?? '',
      placemark.administrativeArea ?? '',
      placemark.country ?? '',
    ].where((s) => s.isNotEmpty).toList();
    return parts.join(', ');
  }

  Set<Marker> _getMarkers() {
    final Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('company'),
        position: companyLocation,
        infoWindow: InfoWindow(title: companyAddress ?? 'Company Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    };

    if (currentLocation != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('current'),
          position: currentLocation!,
          infoWindow: InfoWindow(title: currentAddress ?? 'Your Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }

    return markers;
  }

  Future<void> _fitMapToBounds(GoogleMapController controller) async {
    if (currentLocation != null) {
      final LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          currentLocation!.latitude < companyLocation.latitude
              ? currentLocation!.latitude
              : companyLocation.latitude,
          currentLocation!.longitude < companyLocation.longitude
              ? currentLocation!.longitude
              : companyLocation.longitude,
        ),
        northeast: LatLng(
          currentLocation!.latitude > companyLocation.latitude
              ? currentLocation!.latitude
              : companyLocation.latitude,
          currentLocation!.longitude > companyLocation.longitude
              ? currentLocation!.longitude
              : companyLocation.longitude,
        ),
      );
      await controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      await controller.animateCamera(
        CameraUpdate.newLatLngZoom(companyLocation, 12),
      );
    }
  }

  bool get canCheckIn =>
      selectedProject != null &&
      selectedDepartment != null &&
      selectedCostCode != null &&
      selectedActivity != null &&
      locationStatus == LocationStatus.insideRadius;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const UserInfoCard(),
            const SizedBox(height: 10),
            TimeDisplay(currentDate: currentDate, currentTime: currentTime),
            const SizedBox(height: 10),
            if (!isCheckedIn)
              switch (locationStatus) {
                LocationStatus.loading => const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text(
                        'Checking your location...',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                LocationStatus.insideRadius => Column(
                  children: [
                    DropdownSection(
                      selectedProject: selectedProject,
                      selectedDepartment: selectedDepartment,
                      selectedCostCode: selectedCostCode,
                      selectedActivity: selectedActivity,
                      projects: projects,
                      departments: departments,
                      costCodes: costCodes,
                      activities: activities,
                      onProjectChanged: (v) =>
                          setState(() => selectedProject = v),
                      onDepartmentChanged: (v) =>
                          setState(() => selectedDepartment = v),
                      onCostCodeChanged: (v) =>
                          setState(() => selectedCostCode = v),
                      onActivityChanged: (v) =>
                          setState(() => selectedActivity = v),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: canCheckIn
                          ? () {
                              setState(() {
                                isCheckedIn = true;
                                currentStatus = "Checked-In";
                                checkInTime = currentTime;
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: canCheckIn ? Colors.blue : Colors.grey,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Check-In",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                LocationStatus.outsideRadius => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.location_off,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'You are outside the check-in area',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'You are here: ${currentAddress ?? 'Unknown location'}.\nPlease go to ${companyAddress ?? 'company location'} to check in.',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Distance: ${(distance! / 1000).toStringAsFixed(1)} km',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 250,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: companyLocation,
                              zoom: 12,
                            ),
                            markers: _getMarkers(),
                            circles: {
                              Circle(
                                circleId: const CircleId('radius'),
                                center: companyLocation,
                                radius: radius,
                                fillColor: Colors.blue.withOpacity(0.2),
                                strokeColor: Colors.blue,
                                strokeWidth: 1,
                              ),
                            },
                            onMapCreated: (GoogleMapController controller) {
                              _mapController.complete(controller);
                              _fitMapToBounds(controller);
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _checkLocation,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Retry Location',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                LocationStatus.inaccessible => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.location_disabled,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Unable to access location',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          errorMessage ??
                              'Please enable location services or grant permission.',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/location',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Go to Location Settings',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              }
            else
              Column(
                children: [
                  CheckinDetailsCard(
                    project: selectedProject!,
                    department: selectedDepartment!,
                    costCode: selectedCostCode!,
                    activity: selectedActivity!,
                    checkInTime: checkInTime!,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isCheckedIn = false;
                        currentStatus = "Checked-Out";
                        selectedProject = selectedDepartment =
                            selectedCostCode = selectedActivity = null;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Check-Out",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
