import 'dart:convert';
import 'dart:developer';
import 'package:checkin_checkout/data/models/dropDown_model/dropdown_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:checkin_checkout/core/api/endpoints.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/userrepo.dart';
import 'package:checkin_checkout/core/utils/storage_manager.dart';
import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';
import 'package:checkin_checkout/data/publicobjects.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: UserDetailRepo)
class UserDetailService implements UserDetailRepo {
  @override
  Future<Either<MainFailure, UserDataModel>> getUserDetails() async {
    try {
      final String url = await ApiEndPoints.getOpenSectionUrl();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('token');
      log("${prefs.getString('DeviceId')}");

      if (accessToken == null) {
        log('No access token found');
        return const Left(MainFailure.authFailure());
      }

      final loginRequest = {
        "job_id": "2786",
        "key": "PWA.GetUserDetails",
        "data": {
          "info": '',
          "deviceData": {"deviceType": "mobile"},
          "deviceId": prefs.getString('DeviceId'),
        },
        "result_type": "single",
      };
      final Response response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(loginRequest),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle both single object and list responses
        final dynamic data = response.data;
        UserDataModel userData;

        if (data is List && data.isNotEmpty) {
          userData = UserDataModel.fromJson(data.first as Map<String, dynamic>);
        } else if (data is Map<String, dynamic>) {
          userData = UserDataModel.fromJson(data);
        } else {
          log('Invalid response format');
          return const Left(MainFailure.serverFailure());
        }

        // Store user ID
        PublicObjects.instance.userId = userData.employeeId;
        return Right(userData);
      } else {
        final description = response.data is Map
            ? response.data['description']?.toString() ?? 'Unknown error'
            : 'Unknown error';
        PublicObjects.instance.userDetailsFeedback = description;
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        log('Unauthorized: Token expired or invalid');
        return const Left(MainFailure.authFailure());
      }
      log('Dio error: ${e.message}');
      return const Left(MainFailure.clientFailure());
    } catch (e, stackTrace) {
      log('Unexpected error: $e', stackTrace: stackTrace);
      return const Left(MainFailure.clientFailure());
    }
  }
}
