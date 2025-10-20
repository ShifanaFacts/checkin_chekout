import 'package:checkin_checkout/data/models/dashboard_model/dashboard_model.dart';
import 'package:checkin_checkout/data/models/dropDown_model/dropdown_model.dart';
import 'package:checkin_checkout/data/models/logged_user_data_mode.dart/loggedUser_data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';

abstract class Loggeduserhandlerepo {
  Future<Either<MainFailure, LoggedUserModel>> getLoggedUserDetails(
    double lat,
    double long,
  );
  Future<Either<MainFailure, DashboardModel>> getDashboardList();
  Future<Either<MainFailure, DropdownModel>> getDropDownData([
    String? strdoctype,
    String? description,
  ]);
  Future<Either<MainFailure, DropdownModel>> getAllDropdownData();
}
