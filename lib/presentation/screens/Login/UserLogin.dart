import 'dart:developer';
import 'dart:io' show Platform;

import 'package:checkin_checkout/data/publicobjects.dart';
import 'package:checkin_checkout/presentation/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';
import 'package:animate_do/animate_do.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _deviceInfo = DeviceInfoPlugin();
  final _localAuth = LocalAuthentication();
  String _deviceId = 'Loading...';
  final _employeeIdController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _canUseBiometrics = false;
  bool _isBiometricLoading = false;
  bool _isNfcLoading = false;
  String loginFeedback = "";

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _getDeviceId();
    await _checkBiometricSupport();
  }

  Future<void> _getDeviceId() async {
    try {
      String deviceId;
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        deviceId = androidInfo.id ?? '';
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? '';
      } else {
        deviceId = 'Unsupported platform';
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('DeviceId', deviceId);

      setState(() => _deviceId = deviceId);
    } catch (e, s) {
      log('Device ID error: $e', stackTrace: s);
      setState(() => _deviceId = 'Error');
      _showSnackBar('Failed to get device ID');
    }
  }

  Future<void> _checkBiometricSupport() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final supported = await _localAuth.isDeviceSupported();
      setState(() => _canUseBiometrics = canCheck && supported);
    } catch (e, s) {
      log('Biometric check error: $e', stackTrace: s);
      setState(() => _canUseBiometrics = false);
    }
  }

  Future<void> _performBiometricLogin() async {
    if (!_canUseBiometrics) {
      _showSnackBar('Biometric not supported');
      return;
    }

    setState(() => _isBiometricLoading = true);
    try {
      final authenticated = await _localAuth.authenticate(
        localizedReason: 'Log in with biometrics',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        final prefs = await SharedPreferences.getInstance();
        final savedId = prefs.getString('employeeId') ?? '';
        if (savedId.isNotEmpty) {
          context.read<LoginBloc>().add(
            PerformLogin(logingId: savedId, password: ''),
          );
        } else {
          _showSnackBar('No saved ID for biometric login');
        }
      }
    } catch (e, s) {
      log('Biometric failed: $e', stackTrace: s);
      _showSnackBar('Biometric login failed');
    } finally {
      setState(() => _isBiometricLoading = false);
    }
  }

  Future<void> _performNfcLogin() async {
    setState(() => _isNfcLoading = true);
    await Future.delayed(const Duration(seconds: 1)); // Simulate NFC
    _showSnackBar('NFC login not implemented');
    setState(() => _isNfcLoading = false);
  }

  void _performManualLogin() {
    final id = _employeeIdController.text.trim();
    final pwd = _passwordController.text.trim();

    if (id.isEmpty || pwd.isEmpty) {
      _showSnackBar('Please fill all fields');
      return;
    }

    context.read<LoginBloc>().add(PerformLogin(logingId: id, password: pwd));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  }

  @override
  void dispose() {
    _employeeIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        // Handle navigation & feedback
        if (state.isError) {
          setState(() {
            loginFeedback = 'Login failed. Please try again.';
          });
        } else if (state.loginSucceeded &&
            state.userDataModel?.status == false) {
          setState(() {
            loginFeedback = state.userDataModel?.description ?? "";
          });

          log(
            '${state.userDataModel!.description}state.userDataModel!.description ',
          );
        } else if (state.loginSucceeded &&
            state.userDataModel!.username != "") {
          log('${state.userDataModel!.DID}state.userDataModel!.DID....... ');
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          // Navigate to home
          Navigator.pushReplacementNamed(context, '/home');

          // Success toast
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Welcome, ${state.userDataModel!.username ?? 'User'}!',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.blueGrey),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              // Logo
              FadeInDown(
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person_pin, size: 36, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              FadeInDown(
                delay: const Duration(milliseconds: 100),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ),
              const SizedBox(height: 8),

              FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'Log in to your employee account',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              const SizedBox(height: 30),

              // Employee ID Field
              FadeInDown(
                delay: const Duration(milliseconds: 300),
                child: TextField(
                  controller: _employeeIdController,
                  decoration: InputDecoration(
                    labelText: 'Employee ID',
                    hintText: 'Enter your ID',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password Field
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter password',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.blueAccent,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => setState(
                        () => _isPasswordVisible = !_isPasswordVisible,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Login Button
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.isLoading ? null : _performManualLogin,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                        ),
                        child: state.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Biometric & NFC
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_canUseBiometrics)
                      IconButton(
                        icon: _isBiometricLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.blueAccent,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(
                                Icons.fingerprint,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                        onPressed: _isBiometricLoading
                            ? null
                            : _performBiometricLogin,
                        tooltip: 'Biometric Login',
                      ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: _isNfcLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.blueAccent,
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(
                              Icons.nfc,
                              size: 40,
                              color: Colors.blueAccent,
                            ),
                      onPressed: _isNfcLoading ? null : _performNfcLogin,
                      tooltip: 'NFC Login',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Forgot Password
              FadeInDown(
                delay: const Duration(milliseconds: 700),
                child: TextButton(
                  onPressed: () =>
                      _showSnackBar('Forgot password? Contact admin.'),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 100),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    loginFeedback,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
