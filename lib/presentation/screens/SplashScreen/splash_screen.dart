import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
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
    _checkLoginAndLocationStatus();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkLoginAndLocationStatus() async {
    // Check login status first
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(seconds: 2));

    // if (!isLoggedIn) {
    //   // User not logged in, go to login screen
    //   Navigator.pushReplacementNamed(context, '/login');
    //   return;
    // }

    // User is logged in, now check location permissions
    await _checkLocationPermissions();
  }

  Future<void> _checkLocationPermissions() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services disabled, go to location screen
      Navigator.pushReplacementNamed(context, '/location');
      return;
    }

    // Check location permission status
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // Permission denied, request it
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Permission still denied, go to location screen
        Navigator.pushReplacementNamed(context, '/location');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permission denied forever, open app settings
      await Geolocator.openAppSettings();
      Navigator.pushReplacementNamed(context, '/location');
      return;
    }

    // If we reach here, user has location access
    Navigator.pushReplacementNamed(context, '/home');
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
