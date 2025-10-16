import 'package:checkin_checkout/core/di/injectable.dart';
import 'package:checkin_checkout/core/utils/FirebaseMessagingService.dart';
import 'package:checkin_checkout/firebase_options.dart';
import 'package:checkin_checkout/presentation/blocs/login/login_bloc.dart';

import 'package:checkin_checkout/presentation/blocs/userdata/userdata_bloc.dart';
import 'package:checkin_checkout/presentation/screens/Home/home.dart';
import 'package:checkin_checkout/presentation/screens/Location/location_enable.dart';
import 'package:checkin_checkout/presentation/screens/Login/UserLogin.dart';
import 'package:checkin_checkout/presentation/screens/Register/member_register.dart';
import 'package:checkin_checkout/presentation/screens/SplashScreen/splash_screen.dart';
import 'package:checkin_checkout/presentation/screens/UserSettings/userSettings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Set the background messaging handler early on
  // FirebaseMessaging.onBackgroundMessage(
  //   FirebaseMessagingService.backgroundHandler,
  // );

  // Configure dependency injection
  await configureInjection();
  // await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<LoginBloc>()),
        BlocProvider(create: (ctx) => getIt<UserdataBloc>()),
      ],
      child: MaterialApp(
        title: 'CheckIn CheckOut',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            primary: Color(0xFF3F0644), // Extracted from the gradient
            primaryContainer: Color(0xFFD8A2F2), // Extracted from the gradient
            secondary: Color(0xFFE0C3FC), // Extracted from the gradient
            secondaryContainer: Color(
              0xFFECE2FF,
            ), // Extracted from the gradient

            surface: Colors.white, // Use white as the surface color
            error: Colors.red, // Define your error color
            onPrimary: Colors.white, // Color on primary color
            onSecondary: Colors.white, // Color on secondary color

            onSurface: Colors.black, // Color on surface
            onError: Colors.white, // Color on error
            brightness: Brightness.light, // Use light or dark
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const HomeScreen(),
          '/register': (context) => MemberRegister(),
          '/login': (context) => UserLogin(),
          '/location': (context) => LocationScreen(),
          '/settings': (context) => UserSettings(),
          // Add other routes here
        },
        navigatorKey: navigatorKey, // Set navigatorKey for global access
      ),
    );
  }
}
