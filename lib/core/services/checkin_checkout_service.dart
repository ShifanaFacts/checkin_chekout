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
  Future<Either<MainFailure, CheckinVieModel>> getCheckinData(
    double lat,
    double long,
    Map<String, String> dropDownSelectionObject,
    String checkinTime,
  ) async {
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
        "key": "PWA.SaveTechnicianCheckInDetails",
        "data": {
          "info": {
            "geolat": lat,
            "geolong": long,
            "strheader": dropDownSelectionObject,
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
        CheckinModel userData;

        if (data is List && data.isNotEmpty) {
          userData = CheckinModel.fromJson(data.first as Map<String, dynamic>);
        } else if (data is Map<String, dynamic>) {
          userData = CheckinModel.fromJson(data);
        } else {
          log('Invalid response format');
          return const Left(MainFailure.serverFailure());
        }
        PublicObjects.instance.checkinFeedback = userData.status;

        // If check-in is successful, call the next procedure
        final technicianCheckinResult = await _getTechnicianCheckInDetails(
          dropDownSelectionObject: dropDownSelectionObject,
          systemTime: checkinTime,
          deviceId: prefs.getString('DeviceId') ?? '',
          accessToken: accessToken,
          url: url,
        );

        // Return the CheckinViewModel from _getTechnicianCheckInDetails
        return technicianCheckinResult.fold(
          (failure) => Left(failure),
          (technicianData) => Right(technicianData),
        );
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

  Future<Either<MainFailure, CheckinVieModel>> _getTechnicianCheckInDetails({
    required Map<String, String> dropDownSelectionObject,
    required String systemTime,
    required String deviceId,
    required String accessToken,
    required String url,
  }) async {
    try {
      final request = {
        "job_id": "2786",
        "key": "PWA.GetTechnicianCheckInDetails",
        "data": {
          "info": {
            "strheader": dropDownSelectionObject,
            "system_time": systemTime,
            "deviceID": deviceId,
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
  Future<Either<MainFailure, CheckinModel>> getCheckout({
    required Map<String, String> dropDownSelectionObject,
    required String systemTime,
    required String deviceId,
    required String accessToken,
    required String url,
  }) async {
    try {
      final request = {
        "job_id": "2786",
        "key":
            "PWA.SaveTechnicianCheckOutDetails", // Updated to a checkout-specific key
        "data": {
          "info": {
            "strheader": dropDownSelectionObject,
            "system_time": systemTime,
            "deviceID": deviceId,
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
        CheckinModel checkinDataModel;

        if (data is List && data.isNotEmpty) {
          checkinDataModel = CheckinModel.fromJson(
            data.first as Map<String, dynamic>,
          );
        } else if (data is Map<String, dynamic>) {
          checkinDataModel = CheckinModel.fromJson(data);
        } else {
          log('Invalid response format for technician checkout');
          return const Left(MainFailure.serverFailure());
        }
        log('$checkinDataModel    checkinDataModel');

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

  @override
  Future<Either<MainFailure, CheckinVieModel>> getCheckOutData() {
    // TODO: implement getCheckOutData
    throw UnimplementedError();
  }
}
