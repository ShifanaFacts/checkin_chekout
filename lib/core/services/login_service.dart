// data/services/login_service.dart
import 'dart:convert';
import 'dart:developer';

import 'package:checkin_checkout/core/api/endpoints.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/loginRepo.dart';
import 'package:checkin_checkout/core/utils/storage_manager.dart';
import 'package:checkin_checkout/data/models/login_model/login_model.dart';
import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
      final loginRequest = {
        "client_id": username,
        "client_secret": password,
        "job_id": "2786",
        "hash_method": "0",
        "grant_type": "client_credentials",
      };

      final response = await Dio(BaseOptions()).post(
        url,
        data: loginRequest,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = LoginModel.fromJson(response.data);
        if (result.access_token?.isNotEmpty == true) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', result.access_token!);
          return Right(result);
        } else {
          return const Left(MainFailure.serverFailure());
        }
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        log('Unauthorized - invalid credentials');
        return const Left(MainFailure.authFailure());
      }
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log('Login error: $e');
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> performLogout(BuildContext context) async {
    final String url = await ApiEndPoints.logoutUrl();
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('token') ?? '';

    if (accessToken.isEmpty) {
      await _clearLoginData(prefs, context);
      return const Right(true);
    }

    try {
      final request = {
        "job_id": "2786",
        "key": "PWA.UserLogout",
        "data": {"info": accessToken},
        "result_type": "single",
      };

      final response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(request),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        await _clearLoginData(prefs, context);
        return const Right(true);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await _clearLoginData(prefs, context);
        return const Left(MainFailure.authFailure());
      }
      log('Logout error: $e');
      return const Left(MainFailure.clientFailure());
    } catch (e, s) {
      log('Logout unexpected error', error: e, stackTrace: s);
      return const Left(MainFailure.clientFailure());
    }
  }

  Future<void> _clearLoginData(
    SharedPreferences prefs,
    BuildContext context,
  ) async {
    await prefs.remove('isLoggedIn');
    await prefs.remove('token');
    await StorageManager.deleteToken('ftoken');
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Future<Either<MainFailure, UserDataModel>> getUserDetails() async {
    try {
      final String url = await ApiEndPoints.getOpenSectionUrl();
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('token');
      if (accessToken == null || accessToken.isEmpty) {
        return const Left(MainFailure.authFailure());
      }

      final request = {
        "job_id": "2786",
        "key": "NATIVE.GetUserDetails",
        "data": {
          "info": '',
          "deviceData": {"deviceType": "mobile"},
          "deviceId": prefs.getString('DeviceId'),
        },
        "result_type": "single",
      };

      final response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(request),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final dynamic data = response.data;

        UserDataModel userData;

        if (data is List && data.isNotEmpty) {
          userData = UserDataModel.fromJson(data.first as Map<String, dynamic>);
        } else if (data is Map<String, dynamic>) {
          userData = UserDataModel.fromJson(data);
        } else {
          log('Invalid user details format');
          return const Left(MainFailure.serverFailure());
        }

        return Right(userData);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        log('Token expired during getUserDetails');
        return const Left(MainFailure.authFailure());
      }
      log('Dio error in getUserDetails: ${e.message}');
      return const Left(MainFailure.clientFailure());
    } catch (e, s) {
      log('Unexpected error in getUserDetails: $e', stackTrace: s);
      return const Left(MainFailure.clientFailure());
    }
  }
}
