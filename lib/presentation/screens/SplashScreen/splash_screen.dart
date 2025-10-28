import 'dart:developer';

import 'package:checkin_checkout/core/utils/base_url_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    // Start the whole flow (location + navigation)
    _initializeApp();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// --------------------------------------------------------------
  /// 1. Get location → save to SharedPreferences
  /// 2. Then run the original navigation logic
  /// --------------------------------------------------------------
  Future<void> _initializeApp() async {
    // 1. Get & store location
    await _fetchAndSaveCurrentLocation();

    // 2. Continue with the original navigation checks
    await _checkNavigation();
  }

  /// -----------------------------------------------------------
  /// Get current position (with permission handling) and store it
  /// -----------------------------------------------------------
  Future<void> _fetchAndSaveCurrentLocation() async {
    final prefs = await SharedPreferences.getInstance();

    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // You can show a dialog here if you want
      log('Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permission denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permission denied forever.');
      return;
    }

    // Permission granted → fetch position
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final double lat = position.latitude;
      final double lng = position.longitude;

      await prefs.setDouble('currentLat', lat);
      await prefs.setDouble('currentLong', lng);

      log('Location saved → lat: $lat, long: $lng');
    } catch (e) {
      log('Error getting location: $e');
    }
  }

  /// --------------------------------------------------------------
  /// Original navigation logic (kept unchanged except for removal
  /// of the duplicated permission request)
  /// --------------------------------------------------------------
  Future<void> _checkNavigation() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final String baseUrl = await BaseUrlService.getBaseUrl();

    if (baseUrl.isEmpty) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/settings');
      return;
    }

    if (isLoggedIn) {
      // We already asked for permission in _fetchAndSaveCurrentLocation()
      // so just go to home
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 80.0, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Checking your location...',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
