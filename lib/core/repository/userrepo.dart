import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';

abstract class UserDetailRepo {
  Future<Either<MainFailure, UserDataModel>> getUserDetails();
}
