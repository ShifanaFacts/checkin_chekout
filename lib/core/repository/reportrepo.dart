import 'package:checkin_checkout/data/models/report_model/report_time_modelList.dart';
import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';

abstract class ReportRepo {
  Future<Either<MainFailure, ReportTimeDataModelList>> getReportList(
    String ReportType,
    String fmdate,
    String todate,
  );
}
