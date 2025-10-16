import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:checkin_checkout/core/api/endpoints.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/loginRepo.dart';
import 'package:checkin_checkout/core/utils/storage_manager.dart';
import 'package:checkin_checkout/data/models/login_model/login_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LoginRepo)
class LoginService implements LoginRepo {
  @override
  Future<Either<MainFailure, LoginModel>> performLogin(
      String username, String password) async {
    try {
      var loginrequest = {"username": username, "password": password};

      // log(jsonEncode(loginrequest));
      // log(ApiEndPoints.loginUrl);

      final Response response = await Dio(BaseOptions())
          .post(ApiEndPoints.loginUrl, data: jsonEncode(loginrequest));

      // log('got the response${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(jsonEncode(response.data));

        final result = LoginModel.fromJson(response.data);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        prefs.setString('token', result.token ?? "");
        prefs.setString('uid', result.un ?? "");

        //get fcm tocken here and save fcm token into database
        String? token = await FirebaseMessaging.instance.getToken();
        print("FCM Token: $token");
        await StorageManager.saveToken('ftoken', token ?? "");

        var fcmupdatebody = {
          "containerId": ["postUserFcmToken"],
          "loginid": username,
          "ftoken": token,
        };

        final Response responsefcmupdate = await Dio(BaseOptions()).post(
            ApiEndPoints.getopensectionUrl,
            data: jsonEncode(fcmupdatebody));
        if (responsefcmupdate.statusCode == 200 ||
            responsefcmupdate.statusCode == 201) {
          const Left(MainFailure.serverFailure());
        }

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> performLogout(
      BuildContext context, String loginid) async {
    try {
      var loginrequest = {"loginid": loginid};
      final Response response = await Dio(BaseOptions())
          .post(ApiEndPoints.logoutUrl, data: jsonEncode(loginrequest));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var fcmupdatebody = {
          "containerId": ["performUserLogout"],
          "loginid": loginid
        };

        final Response responsefcmupdate = await Dio(BaseOptions()).post(
            ApiEndPoints.getopensectionUrl,
            data: jsonEncode(fcmupdatebody));
        if (responsefcmupdate.statusCode == 200 ||
            responsefcmupdate.statusCode == 201) {
          const Left(MainFailure.serverFailure());
        }

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        await StorageManager.deleteToken('ftoken');
        try {
          FirebaseMessaging.instance.deleteToken();
        } catch (_) {
          log('Not able to delete the fcm token');
        }

        Navigator.pushReplacementNamed(context, '/login');

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const LoginScreen()),
        // );

        return Right(true);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> deleteFcmToken(String loginid) {
    // TODO: implement deleteFcmToken
    throw UnimplementedError();
  }

  @override
  Future<Either<MainFailure, bool>> getFcmToken(String loginid) {
    // TODO: implement getFcmToken
    throw UnimplementedError();
  }

  @override
  Future<Either<MainFailure, bool>> saveFcmToken(String loginid) {
    // TODO: implement saveFcmToken
    throw UnimplementedError();
  }
}

// Create a GlobalKey for the navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
