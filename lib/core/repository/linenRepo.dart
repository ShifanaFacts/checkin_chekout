import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/linen_model/linen_model.dart';

abstract class LinenRepo {
  Future<Either<MainFailure, List<LinenModel>>> getLinenList(
      propertydoctype, propertydocno);
}
