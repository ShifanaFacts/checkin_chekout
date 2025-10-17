part of 'checkin_checkout_bloc.dart';

@freezed
class CheckinCheckoutEvent with _$CheckinCheckoutEvent {
  const factory CheckinCheckoutEvent.started() = _Started;
}