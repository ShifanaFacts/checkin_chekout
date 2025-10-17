import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';

abstract class ReportRepo {
  Future<Either<MainFailure, List<UserDataModel>>> getReportList(customerId);
}
