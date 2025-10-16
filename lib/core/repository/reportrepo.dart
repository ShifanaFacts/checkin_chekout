import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/report_model/report_entry_model.dart';

abstract class ReportRepo {
  Future<Either<MainFailure, List<ReportEntryModel>>> getReportList(customerId);
}
