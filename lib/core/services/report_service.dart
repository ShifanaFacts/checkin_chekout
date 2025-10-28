import 'dart:convert';
import 'dart:developer';
import 'package:checkin_checkout/core/repository/reportrepo.dart';
import 'package:checkin_checkout/data/models/dashboard_model/dashboard_model.dart';
import 'package:checkin_checkout/data/models/report_model/report_model.dart';
import 'package:checkin_checkout/data/models/report_model/report_time_modelList.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:checkin_checkout/core/api/endpoints.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ReportRepo)
class ReportService implements ReportRepo {
  @override
  Future<Either<MainFailure, ReportTimeDataModelList>> getReportList(
    String ReportType,
    String fmdate,
    String todate,
  ) async {
    try {
      final String url = await ApiEndPoints.getOpenSectionUrl();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('token');

      final loginRequest = {
        "job_id": "2786",
        "key": "NATIVE.StaffInOutReport",
        "data": {
          "info": {
            "ReportType": ReportType,
            "fmdate": fmdate,
            "todate": todate,
          },
        },
        "result_type": "multi",
      };

      final Response response = await Dio(BaseOptions()).post(
        url,
        data: jsonEncode(loginRequest),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final List<dynamic>? inOutReportList = data['Table'] as List<dynamic>?;

        List<ReportDataModel> inOutReportModel = inOutReportList != null
            ? inOutReportList
                  .map((json) => ReportDataModel.fromJson(json))
                  .toList()
            : [];
        // final totalTime = data['Table']?[0]?['TotalHours'];

        // ✅ Only initialize if condition is met
        final ReportTimeDataModelList reportTimeModelList =
            ReportTimeDataModelList(
              TotalTime: "",
              reportModel: inOutReportModel,
            );
        return Right(reportTimeModelList);
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
}
