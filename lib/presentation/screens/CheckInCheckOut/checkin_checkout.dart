import 'package:flutter/material.dart';
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

enum LocationStatus { loading, insideRadius, outsideRadius, inaccessible }

// Custom widget for animated location scanning
class LocationScanningAnimation extends StatefulWidget {
  const LocationScanningAnimation({super.key});

  @override
  LocationScanningAnimationState createState() =>
      LocationScanningAnimationState();
}

class LocationScanningAnimationState extends State<LocationScanningAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lensAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _lensAnimation = Tween<double>(
      begin: -50,
      end: 50,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: LocationLensPainter(
                  lensOffset: _lensAnimation.value,
                  pulseScale: _pulseAnimation.value,
                ),
                child: Container(),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Scanning for your location...',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}

// Custom painter for the location scanning animation
class LocationLensPainter extends CustomPainter {
  final double lensOffset;
  final double pulseScale;

  LocationLensPainter({required this.lensOffset, required this.pulseScale});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint();

    // Draw a subtle map-like background
    paint.color = Colors.grey.shade200;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw simplified map elements (roads)
    paint.color = Colors.grey.shade400;
    paint.strokeWidth = 5;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );

    // Draw a pulsing circle at the center
    paint.color = Colors.blue.withOpacity(0.3);
    canvas.drawCircle(center, 20 * pulseScale, paint);

    // Draw magnifying lens
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    final lensCenter = Offset(center.dx + lensOffset, center.dy);
    canvas.drawCircle(lensCenter, 20, paint);

    // Draw lens handle
    final handleEnd = Offset(
      lensCenter.dx + 20 * cos(pi / 4),
      lensCenter.dy + 20 * sin(pi / 4),
    );
    canvas.drawLine(lensCenter, handleEnd, paint);

    // Draw lens shine effect
    paint.color = Colors.white.withOpacity(0.5);
    paint.strokeWidth = 1;
    canvas.drawLine(
      Offset(lensCenter.dx - 10, lensCenter.dy - 10),
      Offset(lensCenter.dx + 10, lensCenter.dy + 10),
      paint,
    );
  }

  @override
  bool shouldRepaint(LocationLensPainter oldDelegate) {
    return oldDelegate.lensOffset != lensOffset ||
        oldDelegate.pulseScale != pulseScale;
  }
}

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
  LocationStatus locationStatus = LocationStatus.loading;
  double? distance;
  String? currentAddress;
  String? companyAddress;
  String? errorMessage;
  bool _isInitialCheck =
      true; // Flag to track if it's the initial location check
  StreamSubscription<Position>?
  _positionStreamSubscription; // For continuous location monitoring

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(
      this,
    ); // Add observer for lifecycle events
    _startTimeUpdate();
    if (!isCheckedIn) {
      _checkLocation(); // Initial location check only if not checked in
    } else {
      _startLocationMonitoring(); // Start monitoring if already checked in
    }
  }

  void _startTimeUpdate() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return timer.cancel();
      setState(() {
        currentTime = DateFormat(
          'hh:mm:ss a',
        ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed &&
        locationStatus == LocationStatus.inaccessible &&
        !isCheckedIn) {
      _isInitialCheck = false; // Not initial check when resuming
      _checkLocation(); // Re-check location when app resumes, only if not checked in
    } else if (state == AppLifecycleState.resumed && isCheckedIn) {
      _startLocationMonitoring(); // Resume location monitoring when app resumes
    } else if (state == AppLifecycleState.paused) {
      _positionStreamSubscription
          ?.cancel(); // Pause monitoring when app is paused
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer
    _positionStreamSubscription?.cancel(); // Cancel location monitoring
    super.dispose();
  }

  Future<void> _checkLocation() async {
    // Skip location check if already checked in
    if (isCheckedIn) return;

    // Only set loading state for the initial check
    if (_isInitialCheck) {
      setState(() => locationStatus = LocationStatus.loading);
    }

    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationStatus = LocationStatus.inaccessible;
        errorMessage = 'Location services are disabled.';
      });
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        await Geolocator.openLocationSettings();
      }
      return;
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationStatus = LocationStatus.inaccessible;
          errorMessage = 'Location permission denied.';
        });
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          await Geolocator.openLocationSettings();
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationStatus = LocationStatus.inaccessible;
        errorMessage = 'Location permission permanently denied.';
      });
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        await Geolocator.openLocationSettings();
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
        _isInitialCheck = false; // Ensure subsequent checks skip loading
      });

      // Start location monitoring if checked in
      if (isCheckedIn) {
        _startLocationMonitoring();
      }
    } catch (e) {
      setState(() {
        locationStatus = LocationStatus.inaccessible;
        errorMessage = e.toString();
      });
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        await Geolocator.openLocationSettings();
      }
    }
  }

  void _startLocationMonitoring() {
    // Cancel any existing subscription
    _positionStreamSubscription?.cancel();

    // Start listening to position updates
    _positionStreamSubscription =
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 10, // Update when user moves 10 meters
          ),
        ).listen(
          (Position position) {
            if (!isCheckedIn) {
              _positionStreamSubscription?.cancel();
              return;
            }

            double distanceInMeters = Geolocator.distanceBetween(
              position.latitude,
              position.longitude,
              companyLocation.latitude,
              companyLocation.longitude,
            );

            setState(() {
              currentLocation = LatLng(position.latitude, position.longitude);
              distance = distanceInMeters;

              // Update address periodically (optional, to avoid too many geocoding calls)
              _updateAddress(position.latitude, position.longitude);

              // Automatically check out if outside radius
              if (distanceInMeters > radius) {
                isCheckedIn = false;
                currentStatus = "Checked-Out (Moved Outside Radius)";
                selectedProject = null;
                selectedDepartment = null;
                selectedCostCode = null;
                selectedActivity = null;
                checkInTime = null;
                locationStatus = LocationStatus.outsideRadius;
                _positionStreamSubscription
                    ?.cancel(); // Stop monitoring after checkout
              }
            });
          },
          onError: (e) {
            setState(() {
              locationStatus = LocationStatus.inaccessible;
              errorMessage = e.toString();
            });
            _positionStreamSubscription?.cancel();
          },
        );
  }

  Future<void> _updateAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      setState(() {
        currentAddress = placemarks.isNotEmpty
            ? _formatAddress(placemarks.first)
            : 'Unknown location';
      });
    } catch (e) {
      setState(() {
        currentAddress = 'Unknown location';
      });
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
                  child: LocationScanningAnimation(),
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
                              _startLocationMonitoring(); // Start monitoring after check-in
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
                        ElevatedButton(
                          onPressed: () {
                            _isInitialCheck =
                                false; // Ensure retry skips loading
                            _checkLocation();
                          },
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
                          onPressed: () async {
                            await Geolocator.openLocationSettings();
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
                        selectedProject = null;
                        selectedDepartment = null;
                        selectedCostCode = null;
                        selectedActivity = null;
                        checkInTime = null;
                      });
                      _positionStreamSubscription
                          ?.cancel(); // Stop monitoring on manual checkout
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
