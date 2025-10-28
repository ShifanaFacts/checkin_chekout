part of 'user_checkin_checkout_bloc.dart';

@freezed
class UserCheckinCheckoutEvent with _$UserCheckinCheckoutEvent {
  const factory UserCheckinCheckoutEvent.started() = _Started;
  const factory UserCheckinCheckoutEvent.getCheckinData({
    required Map<String, String> dropDownSelectionObject,
    required String checkinTime,
  }) = GetCheckinData;
  const factory UserCheckinCheckoutEvent.getCheckOutData({
    required String checkinTime,
  }) = GetCheckOutData;
  const factory UserCheckinCheckoutEvent.getTechnicianCheckInDetails({
    required String checkinTime,
  }) = GetCheckInDetails;
}
