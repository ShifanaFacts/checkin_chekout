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
  const UserLogin({super.key});

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
  String _loginFeedback = '';
  bool _canUseBiometrics = false;
  bool _isBiometricLoading = false;
  bool _isNfcLoading = false;

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
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      String deviceId;

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id ?? '';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? '';
      } else {
        deviceId = 'Unsupported platform';
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('DeviceId', deviceId);

      setState(() => _deviceId = deviceId);
    } catch (e, stackTrace) {
      log('Error fetching device ID: $e', stackTrace: stackTrace);
      setState(() => _deviceId = 'Error fetching ID');
      _showSnackBar('Error fetching device ID: $e');
    }
  }

  Future<void> _checkBiometricSupport() async {
    try {
      final canAuthenticate =
          await _localAuth.canCheckBiometrics &&
          await _localAuth.isDeviceSupported();
      setState(() => _canUseBiometrics = canAuthenticate);
    } catch (e, stackTrace) {
      log('Error checking biometric support: $e', stackTrace: stackTrace);
      setState(() => _canUseBiometrics = false);
    }
  }

  Future<void> _performBiometricLogin() async {
    if (!_canUseBiometrics) {
      _showSnackBar('Biometric authentication not supported');
      return;
    }

    setState(() => _isBiometricLoading = true);
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
          _showSnackBar('No saved credentials for biometric login');
        }
      }
    } catch (e, stackTrace) {
      log('Biometric authentication failed: $e', stackTrace: stackTrace);
      _showSnackBar('Biometric authentication failed: $e');
    } finally {
      setState(() => _isBiometricLoading = false);
    }
  }

  Future<void> _performNfcLogin() async {
    setState(() => _isNfcLoading = true);
    try {
      // Placeholder for NFC login logic
      _showSnackBar('NFC login not implemented yet');
      // Implement NFC logic using a package like `nfc_manager`
    } catch (e, stackTrace) {
      log('NFC login failed: $e', stackTrace: stackTrace);
      _showSnackBar('NFC login failed: $e');
    } finally {
      setState(() => _isNfcLoading = false);
    }
  }

  void _performLogin() {
    final employeeId = _employeeIdController.text.trim();
    final password = _passwordController.text.trim();
    if (employeeId.isEmpty || password.isEmpty) {
      _showSnackBar('Please fill in all fields');
      return;
    }
    setState(() => _loginFeedback = '');
    BlocProvider.of<LoginBloc>(
      context,
    ).add(PerformLogin(logingId: employeeId, password: password));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            setState(() {
              _loginFeedback = state.isError
                  ? 'Login failed. Please try again.'
                  : '';
            });
            if (state.loginSucceeded) {
              BlocProvider.of<UserdataBloc>(context).add(GetUserData());
            }
          },
        ),
        BlocListener<UserdataBloc, UserdataState>(
          listener: (context, state) {
            if (state.isError) {
              setState(() {
                _loginFeedback =
                    PublicObjects.instance.userDetailsFeedback ?? "";
              });
            } else if (state.datafetched) {
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
                  child: Icon(Icons.person_pin, size: 30, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
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
                        setState(
                          () => _isPasswordVisible = !_isPasswordVisible,
                        );
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
                        icon: _isBiometricLoading
                            ? const CircularProgressIndicator(
                                color: Colors.blueAccent,
                              )
                            : const Icon(
                                Icons.fingerprint,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                        onPressed: _isBiometricLoading
                            ? null
                            : _performBiometricLogin,
                        tooltip: 'Login with Fingerprint',
                      ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: _isNfcLoading
                          ? const CircularProgressIndicator(
                              color: Colors.blueAccent,
                            )
                          : const Icon(
                              Icons.nfc,
                              size: 40,
                              color: Colors.blueAccent,
                            ),
                      onPressed: _isNfcLoading ? null : _performNfcLogin,
                      tooltip: 'Login with NFC',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FadeInDown(
                delay: const Duration(milliseconds: 700),
                child: TextButton(
                  onPressed: () => _showSnackBar('Forgot Password pressed'),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (_loginFeedback.isNotEmpty)
                FadeInDown(
                  delay: const Duration(milliseconds: 800),
                  child: Text(
                    _loginFeedback,
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
