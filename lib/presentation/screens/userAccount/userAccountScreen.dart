import 'package:checkin_checkout/core/di/injectable.dart';
import 'package:checkin_checkout/core/utils/FirebaseMessagingService.dart';
import 'package:checkin_checkout/core/utils/storage_manager.dart';
import 'package:checkin_checkout/data/publicobjects.dart';
import 'package:checkin_checkout/presentation/blocs/login/login_bloc.dart';
import 'package:checkin_checkout/presentation/blocs/userdata/userdata_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({super.key});

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  late FirebaseMessaging _messaging;
  String _userid = '';
  String _username = '';
  int _selectedIndex = 0;
  bool _hasLoadedUserDetails = false;
  bool isLoggedIn = true;

  @override
  void initState() {
    super.initState();
    _initializeFCM();
    _loadUserDetails();
  }

  // Initialize Firebase Cloud Messaging
  void _initializeFCM() async {
    _messaging = getIt<FirebaseMessaging>();
  }

  void _loadUserDetails() async {
    if (!_hasLoadedUserDetails) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _userid = prefs.getString('uid') ?? '';
        _hasLoadedUserDetails = true;
      });

      // BlocProvider.of<UserdataBloc>(context)
      //     .add(GetUserData(logingId: _userid));

      String? token = await _messaging.getToken();
      print("FCM Token: $token");
      await StorageManager.saveToken('ftoken', token ?? "");

      FirebaseMessagingService.setForegroundNotification();
    }
  }

  // Handle logout action
  void _logout() async {
    BlocProvider.of<LoginBloc>(
      context,
    ).add(PerformUserLogout(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserdataBloc, UserdataState>(
      builder: (context, state) {
        // Handle error state
        if (state.isError) {
          // Show error message using ScaffoldMessenger
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Error while getting user details."),
              ),
            );
          });
        }

        // Build the UI
        return Scaffold(
          // appBar: AppBar(
          //   // title: const Text("User Profile"),
          // ),
          body: Column(
            children: [
              _buildUserInfo(),
              const Spacer(),
              _buildLogoutButton(context),
              _buildAboutUsSection(),
            ],
          ),
        );
      },
    );
  }

  /// User Info Section
  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          // Profile Image
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' $_username',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "User location details unavailable.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Logout Button Section
  Widget _buildLogoutButton(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: Colors.grey.shade300,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
          child: TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(2)),
            onPressed: () {
              _logout();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Logged Out"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.logout, color: Colors.redAccent),
                SizedBox(width: 8),
                Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, color: Colors.redAccent),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.grey.shade300,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }

  /// About Us Section
  Widget _buildAboutUsSection() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.grey.shade200,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "About Us",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "We are committed to providing the best services to our customers and improving their user experience with innovative solutions.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
