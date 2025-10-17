import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:checkin_checkout/core/api/endpoints.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/userrepo.dart';
import 'package:checkin_checkout/core/utils/storage_manager.dart';
import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';
import 'package:checkin_checkout/data/models/user_data_model/userdata.dart';
import 'package:checkin_checkout/data/publicobjects.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: UserDetailRepo)
class UserDetailService implements UserDetailRepo {
  @override
  Future<Either<MainFailure, UserDataModel>> getUserDetails() async {
    final String url = await ApiEndPoints.getOpenSectionUrl();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('token');
    try {
      var loginrequest = {
        "job_id": "2786",
        "key": "PWA.GetUserDetails",
        "data": {
          "info": accessToken,
          "deviceData": {},
          "deviceId": PublicObjects.instance.deviceId,
        },
        "result_type": "single",
      };

      final Response response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(loginrequest),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        List<UserDataModel> userList = (response.data as List)
            .map((json) => UserDataModel.fromJson(json as Map<String, dynamic>))
            .toList();

        // Assuming you want to get the first user's roleid
        if (userList.isNotEmpty) {
          if (userList != null && userList.isNotEmpty) {
            UserDataModel userData = userList.first;
            if (userData.DID == PublicObjects.instance.deviceId) {
              prefs.setString('DeviceValidated', userData.DID ?? "");
            } else {
              prefs.setString('DeviceValidated', "");
            }
            return Right(userData);
          } else {
            const Left(MainFailure.serverFailure());
          }
        } else {
          return const Left(MainFailure.serverFailure());
        }
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        log('Unauthorized - token expired or invalid');

        return const Left(MainFailure.authFailure());
      }

      return const Left(MainFailure.clientFailure());
    }
  }
}
