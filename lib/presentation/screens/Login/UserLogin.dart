import 'dart:developer';
import 'dart:io' show Platform;
import 'package:checkin_checkout/data/publicobjects.dart';
import 'package:checkin_checkout/presentation/blocs/login/login_bloc.dart';
import 'package:checkin_checkout/presentation/blocs/userdata/userdata_bloc.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';
import 'package:animate_do/animate_do.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _deviceInfo = DeviceInfoPlugin();
  final _localAuth = LocalAuthentication();
  String _deviceId = 'Loading...';
  final _employeeIdController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? loginFeedback;
  bool _canUseBiometrics = false;

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
      PublicObjects.instance.deviceId = _deviceId;
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error fetching device ID: $e')));
      setState(() {
        _deviceId = 'Error fetching ID';
      });
    }
  }

  Future<void> _checkBiometricSupport() async {
    try {
      final canAuthenticate = await _localAuth.canCheckBiometrics;
      setState(() {
        _canUseBiometrics = canAuthenticate;
      });
    } catch (e) {
      setState(() {
        _canUseBiometrics = false;
      });
    }
  }

  Future<void> _performBiometricLogin() async {
    try {
      final didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Authenticate to log in',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      if (didAuthenticate) {
        final prefs = await SharedPreferences.getInstance();
        final savedEmployeeId = prefs.getString('employeeId') ?? '';
        if (savedEmployeeId.isNotEmpty) {
          BlocProvider.of<LoginBloc>(
            context,
          ).add(PerformLogin(logingId: savedEmployeeId, password: ''));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No saved credentials for biometric login'),
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Biometric authentication failed: $e')),
      );
    }
  }

  Future<void> _performNfcLogin() async {
    // Placeholder for NFC login logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('NFC login not implemented yet')),
    );
    // Implement NFC logic here based on specific hardware and requirements
    // Example: Use a package like `nfc_manager` for NFC tag reading
  }

  void _performLogin() {
    final employeeId = _employeeIdController.text.trim();
    final password = _passwordController.text.trim();
    if (employeeId.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }
    BlocProvider.of<LoginBloc>(
      context,
    ).add(PerformLogin(logingId: employeeId, password: password));
  }

  @override
  void dispose() {
    _employeeIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isError) {
              setState(() {
                loginFeedback = 'Login failed. Please try again.';
              });
            } else if (state.loginSucceeded) {
              BlocProvider.of<UserdataBloc>(context).add(GetUserData());
            }
          },
        ),
        BlocListener<UserdataBloc, UserdataState>(
          listener: (context, state) async {
            final prefs = await SharedPreferences.getInstance();
            final _isDeviceValidated = prefs.getString('DeviceValidated');
            if (_isDeviceValidated == _deviceId) {
              Navigator.pushReplacementNamed(context, '/home');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.white),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Successfully logged in',
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
            } else if (state.isError) {
              setState(() {
                loginFeedback = 'Failed to fetch user data. Please try again.';
              });
            } else if (_isDeviceValidated != _deviceId) {
              setState(() {
                loginFeedback =
                    'Device not recognized. Please log in using a registered device.  ';
              });
            }
          },
        ),
      ],
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person_pin, size: 10, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              FadeInDown(
                delay: const Duration(milliseconds: 100),
                child: Text(
                  'Welcome ',
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
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FadeInDown(
                delay: const Duration(milliseconds: 300),
                child: TextField(
                  controller: _employeeIdController,
                  decoration: InputDecoration(
                    labelText: 'Employee ID',
                    hintText: 'Enter your employee ID',
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
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
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
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.isLoading ? null : _performLogin,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                        ),
                        child: state.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
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
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_canUseBiometrics)
                      IconButton(
                        icon: const Icon(
                          Icons.fingerprint,
                          size: 40,
                          color: Colors.blueAccent,
                        ),
                        onPressed: _performBiometricLogin,
                        tooltip: 'Login with Fingerprint',
                      ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(
                        Icons.nfc,
                        size: 40,
                        color: Colors.blueAccent,
                      ),
                      onPressed: _performNfcLogin,
                      tooltip: 'Login with NFC',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FadeInDown(
                delay: const Duration(milliseconds: 700),
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Forgot Password pressed')),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (loginFeedback != "")
                FadeInDown(
                  delay: const Duration(milliseconds: 800),
                  child: Text(
                    loginFeedback ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
