import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/property_model/property_model.dart';

abstract class PropertyRepo {
  Future<Either<MainFailure, List<PropertyModel>>> getPropertyList(
      customerid, querystring);
}
