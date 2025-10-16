import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/amenities_model/amenities_model.dart';
import 'package:checkin_checkout/data/models/linen_model/linen_model.dart';
import 'package:checkin_checkout/data/models/reporting_category_model/reporting_category_model.dart';
import 'package:checkin_checkout/data/models/reporting_model/reporting_model.dart';
import 'package:checkin_checkout/data/models/servicecall_item_model/servicecall_item_model.dart';
import 'package:checkin_checkout/data/models/servicetype_model/servicetype_model.dart';

abstract class ServiceCallRepo {
  Future<Either<MainFailure, List<ServiceCallItemModel>>> getServiceList(
      customerId, fromDate, toDate);
  Future<Either<MainFailure, List<AmenitiesModel>>> getAminetiesList(
      userloginid);
  Future<Either<MainFailure, List<LinenModel>>> getLinenList(userloginid);
  Future<Either<MainFailure, List<ServiceTypeModel>>> getServiceTypesList(
      userloginid);
  Future<Either<MainFailure, ServiceCallItemModel>> loadServiceCallLog(
      scldoctype, scldocno, loginid);
  Future<Either<MainFailure, bool>> saveServiceCallLog(
      selectedServiceCallLogitem);
  Future<Either<MainFailure, bool>> reportingSave(
    serviceNumber,
    reportingType,
    reportingText,
    reportingImageList,
  );
  Future<Either<MainFailure, List<ReportingCategorymodel>>> getreportingList(
      serviceNum, reportType);

  Future<Either<MainFailure, List<AmenitiesModel>>> loadServiceTypeItemDetails(
      ServiceTypeModel selectedServiceItem);
}
