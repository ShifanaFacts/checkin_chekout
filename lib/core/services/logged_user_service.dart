import 'dart:convert';
import 'dart:developer';
import 'package:checkin_checkout/core/repository/loggedUserHandleRepo.dart';
import 'package:checkin_checkout/data/models/dashboard_model/dashboard_model.dart';
import 'package:checkin_checkout/data/models/dropDown_model/dropdown_model.dart';
import 'package:checkin_checkout/data/models/logged_user_data_mode.dart/loggedUser_data_model.dart';
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

@LazySingleton(as: Loggeduserhandlerepo)
class LoggedUserService implements Loggeduserhandlerepo {
  @override
  Future<Either<MainFailure, LoggedUserModel>> getLoggedUserDetails(
    double lat,
    double long,
  ) async {
    try {
      final String url = await ApiEndPoints.getOpenSectionUrl();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('token');

      if (accessToken == null) {
        log('No access token found');
        return const Left(MainFailure.authFailure());
      }

      final loginRequest = {
        "job_id": "2786",
        "key": "PWA.EMP_Data_OnLoad",
        "data": {
          "info": {
            "geolat": lat.toString(),
            "geolong": long.toString(),
            "strXmlHeader": {"EMP_DATA": ""},
          },
        },
        "result_type": "single",
      };

      final Response response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(loginRequest),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      log(
        'getLoggedUserDetails response: status=${response.statusCode}, data=${response.data}',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          log('Empty response data');
          return const Left(MainFailure.serverFailure());
        }

        final dynamic data = response.data;
        LoggedUserModel loggeduserData;

        if (data is List && data.isNotEmpty) {
          loggeduserData = LoggedUserModel.fromJson(
            data.first as Map<String, dynamic>,
          );
        } else if (data is Map<String, dynamic>) {
          loggeduserData = LoggedUserModel.fromJson(data);
        } else {
          log('Invalid response format');
          return const Left(MainFailure.serverFailure());
        }

        return Right(loggeduserData);
      } else {
        log('Server error: status=${response.statusCode}');
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
  Future<Either<MainFailure, DashboardModel>> getDashboardList() async {
    try {
      final String url = await ApiEndPoints.getOpenSectionUrl();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('token');

      final loginRequest = {
        "job_id": "2786",
        "key": "FTR.GetDropDownList",
        "data": {"info": {}},
        "result_type": "single",
      };

      final Response response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(loginRequest),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final dynamic data = response.data;
        DashboardModel dashboardModel;

        if (data is List && data.isNotEmpty) {
          var jsonData = data.first as Map<String, dynamic>;
          if (jsonData['jsonResult'] is String) {
            try {
              jsonData['jsonResult'] = jsonDecode(
                jsonData['jsonResult'] as String,
              );
            } catch (e) {
              log('Error decoding jsonResult: $e');
              return const Left(MainFailure.serverFailure());
            }
          }
          dashboardModel = DashboardModel.fromJson(jsonData);
        } else if (data is Map<String, dynamic>) {
          if (data['jsonResult'] is String) {
            try {
              data['jsonResult'] = jsonDecode(data['jsonResult'] as String);
            } catch (e) {
              log('Error decoding jsonResult: $e');
              return const Left(MainFailure.serverFailure());
            }
          }
          dashboardModel = DashboardModel.fromJson(data);
        } else {
          log('Invalid response format');
          return const Left(MainFailure.serverFailure());
        }
        log(
          'Dashboard data: ${dashboardModel.jsonResult?.map((e) => e.loadOnClick).toList()}',
        );

        return Right(dashboardModel);
      } else {
        log('Server error: status=${response.statusCode}');
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
  Future<Either<MainFailure, DropdownModel>> getDropDownData([
    String? strdoctype,
    String? description,
    double? lat,
    double? long,
  ]) async {
    try {
      final String url = await ApiEndPoints.getOpenSectionUrl();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('token');
      final loginRequest = {
        "job_id": "2786",
        "key": "PWA.GetCommonList",
        "data": {
          "info": {
            "geolat": lat,
            "geolong": long,
            "strXmlHeader": {"EMP_DATA": ""},
            "strdoctype": strdoctype ?? "Dept",
            "strcommontype": "manual",
            "FilterCondition": description,
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
        if (response.data == null) {
          log('Empty response data for strDocType: $strdoctype');
          return const Left(MainFailure.serverFailure());
        }

        final dynamic data = response.data;
        List<DropdownItem> items;

        if (data is List) {
          items = data
              .map(
                (item) => DropdownItem.fromJson(item as Map<String, dynamic>),
              )
              .toList();
        } else if (data is Map<String, dynamic>) {
          if (data['jsonResult'] is String) {
            try {
              data['jsonResult'] = jsonDecode(data['jsonResult'] as String);
            } catch (e) {
              log('Error decoding jsonResult in getDropDownData: $e');
              return const Left(MainFailure.serverFailure());
            }
          }
          items =
              (data['jsonResult'] as List<dynamic>?)
                  ?.map(
                    (item) =>
                        DropdownItem.fromJson(item as Map<String, dynamic>),
                  )
                  .toList() ??
              [];
        } else {
          log('Invalid response format for strDocType: $strdoctype');
          return const Left(MainFailure.serverFailure());
        }

        log(
          'Fetched ${items.length} items for strDocType: $strdoctype, description: $description',
        );
        return Right(
          DropdownModel(dropdownsByDescription: {strdoctype ?? 'Dept': items}),
        );
      } else {
        log(
          'Server error: status=${response.statusCode} for strDocType: $strdoctype',
        );
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        log(
          'Unauthorized: Token expired or invalid for strDocType: $strdoctype',
        );
        return const Left(MainFailure.authFailure());
      }
      log('Dio error: ${e.message} for strDocType: $strdoctype');
      return const Left(MainFailure.clientFailure());
    } catch (e, stackTrace) {
      log(
        'Unexpected error: $e for strDocType: $strdoctype',
        stackTrace: stackTrace,
      );
      return const Left(MainFailure.clientFailure());
    }
  }
}
