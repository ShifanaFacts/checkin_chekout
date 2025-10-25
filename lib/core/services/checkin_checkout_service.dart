import 'dart:convert';
import 'dart:developer';
import 'package:checkin_checkout/core/repository/checkin_checkout_repo.dart';
import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_model.dart';
import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:checkin_checkout/core/api/endpoints.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/publicobjects.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: CheckinCheckoutRepo)
class CheckinCheckoutService implements CheckinCheckoutRepo {
  @override
  Future<Either<MainFailure, CheckinModel>> getCheckinData(
    double lat,
    double long,
    Map<String, String> dropDownSelectionObject,
    String checkinTime,
  ) async {
    try {
      final String url = await ApiEndPoints.getOpenSectionUrl();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        "dropDownSelectionObject",
        jsonEncode(dropDownSelectionObject),
      );
      final accessToken = prefs.getString('token');

      if (accessToken == null) {
        log('No access token found');
        return const Left(MainFailure.authFailure());
      }

      final loginRequest = {
        "job_id": "2786",
        "key": "PWA.SaveTechnicianCheckInDetails",
        "data": {
          "info": {
            "geolat": lat,
            "geolong": long,
            "strheader": {...dropDownSelectionObject, "doctype": 'SDT'},
            "system_time": checkinTime,
            "deviceID": prefs.getString('DeviceId'),
          },
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
        CheckinModel checkinModel;

        if (data is List && data.isNotEmpty) {
          checkinModel = CheckinModel.fromJson(
            data.first as Map<String, dynamic>,
          );
        } else if (data is Map<String, dynamic>) {
          checkinModel = CheckinModel.fromJson(data);
        } else {
          log('Invalid response format');
          return const Left(MainFailure.serverFailure());
        }

        // Return the CheckinViewModel from _getTechnicianCheckInDetails
        return Right(checkinModel);
      } else {
        final description = response.data is Map
            ? response.data['description']?.toString() ?? 'Unknown error'
            : 'Unknown error';
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

  @override
  Future<Either<MainFailure, CheckinVieModel>> getTechnicianCheckInDetails(
    double long,
    double lat,
    String systemTime,
  ) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final storedString = prefs.getString("dropDownSelectionObject");
      Map<String, String>? dropDownSelectionObject;

      if (storedString != null) {
        final Map<String, dynamic> decoded = jsonDecode(storedString);
        dropDownSelectionObject = decoded.map(
          (key, value) => MapEntry(key, value.toString()),
        );
      }
      final accessToken = prefs.getString('token');
      final String url = await ApiEndPoints.getOpenSectionUrl();
      final request = {
        "job_id": "2786",
        "key": "PWA.GetTechnicianCheckInDetails",
        "data": {
          "info": {
            "geolat": lat,
            "geolong": long,

            "strheader": {...?dropDownSelectionObject, "doctype": 'SDT'},
            "system_time": systemTime,
            "deviceID": prefs.getString('DeviceId') ?? '',
          },
        },
        "result_type": "single",
      };

      final Response response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(request),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final dynamic data = response.data;
        CheckinVieModel checkinDataModel;

        if (data is List && data.isNotEmpty) {
          checkinDataModel = CheckinVieModel.fromJson(
            data.first as Map<String, dynamic>,
          );
        } else if (data is Map<String, dynamic>) {
          checkinDataModel = CheckinVieModel.fromJson(data);
        } else {
          log('Invalid response format for technician check-in');
          return const Left(MainFailure.serverFailure());
        }
        log('$checkinDataModel    checkinViewModel');

        return Right(checkinDataModel);
      } else {
        final description = response.data is Map
            ? response.data['description']?.toString() ?? 'Unknown error'
            : 'Unknown error';
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

  // ---------------------------------------------------------------------------
  @override
  Future<Either<MainFailure, CheckinModel>> getCheckOutData(
    double lat,
    double long,
    String checkinTime,
  ) async {
    try {
      final String url = await ApiEndPoints.getOpenSectionUrl();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('token');
      final storedString = prefs.getString("dropDownSelectionObject");
      Map<String, String>? dropDownSelectionObject;

      if (storedString != null) {
        final Map<String, dynamic> decoded = jsonDecode(storedString);
        dropDownSelectionObject = decoded.map(
          (key, value) => MapEntry(key, value.toString()),
        );
      }
      final request = {
        "job_id": "2786",
        "key": "PWA.SaveTechnicianCheckOutDetails",
        "data": {
          "info": {
            "geolat": lat,
            "geolong": long,
            "system_time": checkinTime,
            "deviceID": prefs.getString('DeviceId'),
            "strheader": {...?dropDownSelectionObject, "doctype": 'SDT'},
          },
        },
        "result_type": "single",
      };

      final Response response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(request),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final dynamic data = response.data;
        CheckinModel checkinModel;

        if (data is List && data.isNotEmpty) {
          checkinModel = CheckinModel.fromJson(
            data.first as Map<String, dynamic>,
          );
        } else if (data is Map<String, dynamic>) {
          checkinModel = CheckinModel.fromJson(data);
        } else {
          log('Invalid response format for technician checkout');
          return const Left(MainFailure.serverFailure());
        }
        log('$checkinModel    checkinDataModel');

        return Right(checkinModel);
      } else {
        final description = response.data is Map
            ? response.data['description']?.toString() ?? 'Unknown error'
            : 'Unknown error';
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
