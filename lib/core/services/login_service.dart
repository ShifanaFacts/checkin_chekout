import 'dart:convert';
import 'dart:developer';
import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';
import 'package:checkin_checkout/data/publicobjects.dart';
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
    String username,
    String password,
  ) async {
    final String url = await ApiEndPoints.loginUrl();
    try {
      var loginRequest = {
        "client_id": username,
        "client_secret": password,
        "job_id": "2786",
        "hash_method": "0",
        "grant_type": "client_credentials",
      };

      final Response response = await Dio(BaseOptions()).post(
        url,
        data: loginRequest,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = LoginModel.fromJson(response.data);
        // Check if the response contains a token to determine success
        if (result.access_token == null || result.access_token!.isEmpty) {
          return const Left(MainFailure.serverFailure());
        } else {
          PublicObjects.instance.loginid = result.access_token;
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        prefs.setString('token', result.access_token ?? "");

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        log('Unauthorized - token expired or invalid');

        return const Left(MainFailure.authFailure());
      }
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> performLogout(BuildContext context) async {
    final String url = await ApiEndPoints.logoutUrl();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('token');

    if (accessToken!.isEmpty) {
      await prefs.remove('isLoggedIn');
      await prefs.remove('token');
      await StorageManager.deleteToken('ftoken');
      Navigator.pushReplacementNamed(context, '/login');
    }
    try {
      var loginrequest = {
        "job_id": "2786",
        "key": "PWA.UserLogout",
        "data": {"info": accessToken},
        "result_type": "single",
      };

      final Response response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(loginrequest),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        await prefs.remove('isLoggedIn');
        await prefs.remove('token');

        // prefs.clear();
        await StorageManager.deleteToken('ftoken');

        Navigator.pushReplacementNamed(context, '/login');

        return Right(true);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e, s) {
      log("Error fetching operations", error: e, stackTrace: s);
      // 🔹 Case 1: Unauthorized (expired/invalid token)
      if (e is DioException && e.response?.statusCode == 401) {
        log('Unauthorized - token expired or invalid');

        return const Left(MainFailure.authFailure());
      }
      return const Left(MainFailure.clientFailure());
    }
  }
}
