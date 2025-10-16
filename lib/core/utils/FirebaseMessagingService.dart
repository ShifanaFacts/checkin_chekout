import 'package:checkin_checkout/core/di/injectable.dart';
import 'package:checkin_checkout/core/utils/storage_manager.dart';
import 'package:checkin_checkout/data/publicobjects.dart';
import 'package:checkin_checkout/presentation/blocs/userdata/userdata_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseMessagingService {
  FirebaseMessagingService() {
    _initialize();
  }

  void _initialize() {
    final FirebaseMessaging _firebaseMessaging = getIt<FirebaseMessaging>();
    _firebaseMessaging.requestPermission();

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _showNotificationDialog(message);
      }
    });
  }

  static void setForegroundNotification() {
    final FirebaseMessaging _firebaseMessaging = getIt<FirebaseMessaging>();
    _firebaseMessaging.onTokenRefresh.listen((newToken) async {
      // Save the new token in secure storage
      await StorageManager.saveToken('ftoken', newToken);

      BlocProvider.of<UserdataBloc>(navigatorKey.currentContext!).add(
          PostUserFCMToken(
              logingId: PublicObjects.instance.loginid!, token: newToken));
      // Optionally, send the new token to your server for notification management
    });
  }

  void _showNotificationDialog(RemoteMessage message) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text(message.notification!.title ?? 'Notification'),
        content: Text(message.notification!.body ?? 'No content'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static Future<void> backgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
  }
}

// Create a GlobalKey for the navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
