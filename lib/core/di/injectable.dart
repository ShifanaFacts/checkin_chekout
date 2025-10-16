// import 'package:checkin_checkout/core/di/injectable.config.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';

// final getIt = GetIt.instance;

// @InjectableInit()
// Future<void> configureInjection() async {
//   await getIt.init(environment: Environment.prod);
//   getIt.registerLazySingleton<FirebaseMessaging>(
//       () => FirebaseMessaging.instance);
//   return;
// }

import 'package:checkin_checkout/core/di/injectable.config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  await getIt.init(environment: Environment.prod);
  getIt.registerLazySingleton<FirebaseMessaging>(
      () => FirebaseMessaging.instance);
  return;
}
