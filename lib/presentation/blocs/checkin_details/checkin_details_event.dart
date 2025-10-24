part of 'checkin_details_bloc.dart';

@freezed
class CheckinDetailsEvent with _$CheckinDetailsEvent {
  const factory CheckinDetailsEvent.started() = _Started;
  const factory CheckinDetailsEvent.getTechnicianCheckInDetails({
    required double lat,
    required double long,
    required String checkinTime,
  }) = GetCheckInDetails;
}
