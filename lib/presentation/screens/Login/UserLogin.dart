import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _deviceInfo = DeviceInfoPlugin();
  String _deviceId = 'Loading...';
  final _employeeIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getDeviceId();
  }

  Future<void> _getDeviceId() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        setState(() {
          _deviceId = androidInfo.id ?? 'Unknown';
        });
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        setState(() {
          _deviceId = iosInfo.identifierForVendor ?? 'Unknown';
        });
      } else {
        setState(() {
          _deviceId = 'Unsupported platform';
        });
      }
    } catch (e) {
      print('Error fetching device ID: $e'); // Log error for debugging
      setState(() {
        _deviceId = 'Error fetching ID';
      });
    }
  }

  @override
  void dispose() {
    _employeeIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Login'),
        // backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person_pin, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Welcome Text
            Text(
              'Log in to your employee account.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            // Employee ID Field
            TextField(
              controller: _employeeIdController,
              decoration: InputDecoration(
                labelText: 'Employee ID',
                hintText: 'Enter your employee ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 20),
            // Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add login logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login button pressed')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.blue,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Forgot Password
            TextButton(
              onPressed: () {
                // Add forgot password logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Forgot Password pressed')),
                );
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blueGrey[900]),
              ),
            ),
            // const SizedBox(height: 20),
            // // Biometric Login
            // Text(
            //   'For faster access, set up your biometric login.',
            //   style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            // ),
            // const SizedBox(height: 10),
            // OutlinedButton.icon(
            //   onPressed: () {
            //     // Add biometric login setup logic here
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Biometric Login pressed')),
            //     );
            //   },
            //   icon: Icon(Icons.fingerprint, color: Colors.blueGrey[900]),
            //   label: Text(
            //     'Enable Biometric Login',
            //     style: TextStyle(color: Colors.blueGrey[900]),
            //   ),
            //   style: OutlinedButton.styleFrom(
            //     padding: const EdgeInsets.symmetric(vertical: 15),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            // Display Device ID
            Text(
              'Device ID: $_deviceId',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20), // Extra padding to avoid overflow
          ],
        ),
      ),
    );
  }
}
