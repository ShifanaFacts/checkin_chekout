import 'package:checkin_checkout/data/publicobjects.dart';
import 'package:checkin_checkout/presentation/blocs/loggedUserHandles/logged_user_handle_bloc.dart';
import 'package:checkin_checkout/presentation/screens/CheckInCheckOut/widgets/locationLoadingAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';
import 'dart:math';

import 'widgets/user_info_card.dart';
import 'widgets/time_display.dart';
import 'widgets/dropdown_section.dart';
import 'widgets/checkin_details_card.dart';

enum LocationStatus { insideRadius, outsideRadius, inaccessible }

class CheckinCheckout extends StatefulWidget {
  const CheckinCheckout({super.key});

  @override
  CheckinCheckoutState createState() => CheckinCheckoutState();
}

class CheckinCheckoutState extends State<CheckinCheckout>
    with WidgetsBindingObserver {
  String currentTime = DateFormat(
    'hh:mm:ss a',
  ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
  String currentDate = DateFormat(
    'EEEE, MMMM d, yyyy',
  ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));

  bool isCheckedIn = false;
  String currentStatus = "Not Checked-In";
  String? checkInTime;

  LatLng? currentLocation;
  final LatLng companyLocation = const LatLng(25.276987, 55.296249); // Dubai
  final double radius = 10000; // 10km
  LocationStatus? locationStatus;
  double? distance;
  String? currentAddress;
  String? companyAddress;
  String? errorMessage;
  bool _isInitialCheck = true;
  StreamSubscription<Position>? _positionStreamSubscription;

  // Dropdown selections (dummy placeholders)
  String? selectedProject;
  String? selectedDepartment;
  String? selectedCostCode;
  String? selectedActivity;

  bool get canCheckIn => locationStatus == LocationStatus.insideRadius;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startTimeUpdate();
    _checkLocationPermission(); // Modified to check permission first
  }

  void _startTimeUpdate() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        currentTime = DateFormat(
          'hh:mm:ss a',
        ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  String _formatAddress(Placemark placemark) {
    return "${placemark.name}, ${placemark.locality}, ${placemark.country}";
  }

  double _calculateDistance(LatLng start, LatLng end) {
    const double earthRadius = 6371000; // meters
    double dLat = _toRadians(end.latitude - start.latitude);
    double dLon = _toRadians(end.longitude - start.longitude);
    double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(start.latitude)) *
            cos(_toRadians(end.latitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }

  Future<void> _checkLocationPermission() async {
    if (isCheckedIn) return;

    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationStatus = LocationStatus.inaccessible;
        errorMessage = 'Location services are disabled.';
      });
      return;
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationStatus = LocationStatus.inaccessible;
          errorMessage = 'Location permission denied.';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationStatus = LocationStatus.inaccessible;
        errorMessage = 'Location permission permanently denied.';
      });
      return;
    }

    // If permissions are granted, proceed to check location
    await _checkLocation();
  }

  Future<void> _checkLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).timeout(const Duration(seconds: 10));

      currentLocation = LatLng(position.latitude, position.longitude);
      distance = _calculateDistance(currentLocation!, companyLocation);

      locationStatus = distance! <= radius
          ? LocationStatus.insideRadius
          : LocationStatus.outsideRadius;

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

      setState(() {});
    } catch (e) {
      setState(() {
        locationStatus = LocationStatus.inaccessible;
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
      "${PublicObjects.instance.checkinFeedback}mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            UserInfoCard(
              latitude: currentLocation?.latitude ?? 0.0,
              longitude: currentLocation?.longitude ?? 0.0,
            ),
            const SizedBox(height: 10),
            TimeDisplay(currentDate: currentDate, currentTime: currentTime),
            const SizedBox(height: 10),
            if (PublicObjects.instance.checkinFeedback == 'checkin')
              Column(
                children: [
                  CheckinDetailsCard(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      PublicObjects.instance.checkinFeedback = 'checkout';
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("✅ Check-out successful!"),
                          backgroundColor: Colors.green,
                        ),
                      );
                      setState(() {
                        isCheckedIn = false;
                        currentStatus = "Checked-Out";
                        selectedProject = null;
                        selectedDepartment = null;
                        selectedCostCode = null;
                        selectedActivity = null;
                        checkInTime = null;
                      });
                      _positionStreamSubscription?.cancel();
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
              )
            else
              Column(
                children: [
                  DropdownSection(
                    latitude: currentLocation?.latitude ?? 0.0,
                    longitude: currentLocation?.longitude ?? 0.0,
                  ),
                ],
              ),

            // if (!isCheckedIn)
            //   Builder(
            //     builder: (_) {
            //       if (locationStatus == LocationStatus.inaccessible) {
            //         return _buildInaccessibleCard();
            //       } else {
            //         return
            //       }
            //     },
            //   )
            // else
          ],
        ),
      ),
    );
  }

  Widget _buildInaccessibleCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Icon(Icons.location_disabled, size: 48, color: Colors.red),
            const SizedBox(height: 10),
            const Text(
              'Unable to access location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage ??
                  'Please enable location services or grant permission.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
                // Re-check permissions after user returns from settings
                await _checkLocationPermission();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Open Location Settings',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
