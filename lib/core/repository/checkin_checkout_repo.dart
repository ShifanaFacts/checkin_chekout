import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_model.dart';
import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';

abstract class CheckinCheckoutRepo {
  Future<Either<MainFailure, CheckinModel>> getCheckinData(
    Map<String, String> dropDownSelectionObject,
    String checkinTime,
  );

  Future<Either<MainFailure, CheckinModel>> getCheckOutData(String checkinTime);
  Future<Either<MainFailure, CheckinVieModel>> getTechnicianCheckInDetails(
    String systemTime,
  );
}
