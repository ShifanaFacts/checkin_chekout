import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/login_model/login_model.dart';

abstract class ILoginService {
  Future<Either<MainFailure, LoginModel>> performLogin(
      String username, String password);
}
