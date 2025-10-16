import 'package:dartz/dartz.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/data/models/Servicezonefilter_model/Servicezonefilter_model.dart';
import 'package:checkin_checkout/data/models/servicetask_model/servicetask_model.dart';
import 'package:checkin_checkout/data/models/servicetask_checklist_model/servicetask_checklist_model.dart';

abstract class ServiceTaskRepo {
  Future<Either<MainFailure, String>> taskServicetaskTrack(
      updatedTaskTrack, servnum, scldocno);
  Future<Either<MainFailure, String>> taskServicetaskTrackImageSave({
    required String imageUrlName,
    required String imageTypeName,
    required String serviceNumber,
    required String propertyCode,
    required String propertyTypeCode,
    required String attkey,
    required String serviceTypeCode,
    required String imageName,
  });
  Future<Either<MainFailure, List<ServiceTaskModel>>>
      taskServicetaskTrackImageList(
          serviceNum, propertyCode, prooerTypeCode, serviceDocType);
  Future<Either<MainFailure, List<ServiceTaskCheckListModel>>>
      taskServicetaskTrackCheckList(
          serviceNum, propertyCode, prooerTypeCode, serviceDocType);
  Future<Either<MainFailure, String>> taskServicetaskTrackCheckListSave(
      taskCheckItemsList, serviceNumber, serviceTypeCode);

  Future<Either<MainFailure, bool>> serviceCancel(
      serviceNumber, reasonForCancel);

  Future<Either<MainFailure, bool>> supervisorServiceRating(
      serviceNumber, serviceRating);

  Future<Either<MainFailure, List<ServiceZoneFilterModel>>>
      supervisorZoneFiltering();
}
