import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/amenities_model/amenities_model.dart';
import 'package:checkin_checkout/data/models/linen_model/linen_model.dart';
import 'package:checkin_checkout/data/models/servicetype_model/servicetype_model.dart';

abstract class ServiceTypeItemRepo {
  Future<Either<MainFailure, List<AmenitiesModel>>> getServiceAmenitiesList(
      propertydoctype, propertydocno, serviceitemtype);
  Future<Either<MainFailure, List<LinenModel>>> getServiceLinenList(
      propertydoctype, propertydocno, serviceitemtype);

  Future<Either<MainFailure, List<ServiceTypeModel>>> getServiceTypeItemList(
      propertydoctype, propertydocno);
}
