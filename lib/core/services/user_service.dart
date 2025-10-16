import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:checkin_checkout/core/api/endpoints.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/userrepo.dart';
import 'package:checkin_checkout/core/utils/storage_manager.dart';
import 'package:checkin_checkout/data/models/apiresponsemodel.dart';
import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';
import 'package:checkin_checkout/data/models/user_data_model/userdata.dart';
import 'package:checkin_checkout/data/publicobjects.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: UserDetailRepo)
class UserDetailService implements UserDetailRepo {
  @override
  Future<Either<MainFailure, UserDataModel>> getUserDetails(userloginid) async {
    try {
      var loginrequest = {
        "containerId": ["getUserDetails"],
        "loginId": userloginid
      };

      final Response response = await Dio(BaseOptions())
          .post(ApiEndPoints.getopensectionUrl, data: jsonEncode(loginrequest));

      // log('got the response${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(jsonEncode(response.data));

        List<ApiResponseModel> apiResponses = (response.data as List)
            .map((json) => ApiResponseModel.fromJson(json))
            .toList();

        // Assuming you want to get the first user's roleid
        if (apiResponses.isNotEmpty) {
          ApiResponseModel firstResponse = apiResponses[0];

          // log(jsonEncode(firstResponse.data));

          UserData udata = UserData.fromJson(firstResponse.data);

          // log(jsonEncode(udata));

          if (udata.dataset != null && udata.dataset!.isNotEmpty) {
            UserDataModel userData = udata.dataset!.first;

            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // prefs.setString('rl', userData.roleid ?? "");
            // prefs.setString('un', userData.name ?? "");

            PublicObjects.instance.roleid = userData.roleid;
            PublicObjects.instance.name = userData.name;
            PublicObjects.instance.usertype = userData.usertype;
            PublicObjects.instance.loginid = userloginid;

            return Right(userData);
          } else {
            const Left(MainFailure.serverFailure());
          }
        } else {
          return const Left(MainFailure.serverFailure());
        }
      }
      return const Left(MainFailure.serverFailure());
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, String>> getUserFCMToken(userloginid) async {
    try {
      var loginrequest = {
        "containerId": ["getUserFcmToken"],
        "loginid": userloginid
      };

      log("getUserFcmToken");

      final Response response = await Dio(BaseOptions())
          .post(ApiEndPoints.getopensectionUrl, data: jsonEncode(loginrequest));

      // log('got the response${response.statusCode}');

      // Get the token for this device
      String? token = "";

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<ApiResponseModel> apiResponses = (response.data as List)
            .map((json) => ApiResponseModel.fromJson(json))
            .toList();

        // Assuming you want to get the first user's roleid
        if (apiResponses.isNotEmpty) {
          ApiResponseModel firstResponse = apiResponses[0];

          var dataset = firstResponse.data['dataset'];

          token = jsonEncode(dataset[0]["ftoken"]);

          log(token);
        }

        FirebaseMessaging messaging = FirebaseMessaging.instance;
        token = await messaging.getToken();
        print("FCM Token: $token");
        await StorageManager.saveToken('ftoken', token ?? "");

        // Handle foreground messages
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          print('Notification message data: ${message.data}');

          if (message.notification != null) {
            print(
                'Message also contained a notification: ${message.notification}');
          }
        });
      }
      return const Left(MainFailure.serverFailure());
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, String>> postUserFCMToken(
      userloginid, token) async {
    try {
      var fcmupdatebody = {
        "containerId": ["postUserFcmToken"],
        "loginid": userloginid,
        "ftoken": token,
      };
      log("postUserFCMToken");

      final Response responsefcmupdate = await Dio(BaseOptions()).post(
          ApiEndPoints.getopensectionUrl,
          data: jsonEncode(fcmupdatebody));
      if (responsefcmupdate.statusCode == 200 ||
          responsefcmupdate.statusCode == 201) {
        List<ApiResponseModel> apiResponses = (responsefcmupdate.data as List)
            .map((json) => ApiResponseModel.fromJson(json))
            .toList();

        return Right(token);
      }
      return const Left(MainFailure.serverFailure());
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
