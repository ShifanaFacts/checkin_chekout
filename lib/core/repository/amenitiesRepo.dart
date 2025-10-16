import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/amenities_model/amenities_model.dart';

abstract class AmenitiesRepo {
  Future<Either<MainFailure, List<AmenitiesModel>>> getAmenitiesList(
      propertydoctype, propertydocno);
}
