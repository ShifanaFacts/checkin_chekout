part of 'checkin_checkout_bloc.dart';

@freezed
class CheckinCheckoutEvent with _$CheckinCheckoutEvent {
  const factory CheckinCheckoutEvent.initialize() = Initialize;
  const factory CheckinCheckoutEvent.getCheckinData({
    required double lat,
    required double long,
    required Map<String, String> dropDownSelectionObject,
    required String checkinTime,
  }) = GetCheckinData;
  const factory CheckinCheckoutEvent.getCheckOutData() = GetCheckOutData;
}
