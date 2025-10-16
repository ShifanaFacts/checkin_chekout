import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationEnableWidget(
      onLocationEnabled: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      title: 'Location Required',
      message: 'Please enable location services to access the home page.',
    );
  }
}

class LocationEnableWidget extends StatelessWidget {
  final VoidCallback onLocationEnabled;
  final String title;
  final String message;

  const LocationEnableWidget({
    super.key,
    required this.onLocationEnabled,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Location Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFE6F0FA),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.location_on, color: Colors.blue[700], size: 50),
            ),
            const SizedBox(height: 20),
            // Title
            Text(
              'Enable Location Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            // Message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Location is required to accurately record check-in and check-out times for attendance and payroll purposes. Location is only tracked during these actions.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 30),
            // Enable Location Button
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: onLocationEnabled,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Enable Location'),
              ),
            ),
            const SizedBox(height: 10),
            // Not Now Button
            // TextButton(
            //   onPressed: () {},
            //   child: const Text(
            //     'Not Now',
            //     style: TextStyle(fontSize: 16, color: Colors.black87),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
