import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/driver_schedule_model/driver_schedule_model.dart';

abstract class DriverScheduleRepo {
  Future<Either<MainFailure, List<DriverScheduleModel>>> getdriverScheduleList(
      loginId, selectedDate);

  Future<Either<MainFailure, List<DriverScheduleModel>>>
      getdriverUpcommingScheduleList();

  Future<Either<MainFailure, bool>> changeDriverStatus(
      updatedTaskTrack, driverScheduledTask);
}
