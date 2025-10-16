import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/login_model/login_model.dart';
import 'package:flutter/material.dart';

abstract class LoginRepo {
  Future<Either<MainFailure, LoginModel>> performLogin(
      String username, String password);

  Future<Either<MainFailure, bool>> performLogout(
      BuildContext context, String loginid);

  // Future<Either<MainFailure, bool>> saveFcmToken(String loginid);

  // Future<Either<MainFailure, bool>> getFcmToken(String loginid);

  // Future<Either<MainFailure, bool>> deleteFcmToken(String loginid);
}
