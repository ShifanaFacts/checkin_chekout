part of 'checkin_checkout_bloc.dart';

@freezed
class CheckinCheckoutState with _$CheckinCheckoutState {
  const factory CheckinCheckoutState({
    CheckinVieModel? checkinmodel,
    required bool isLoading,
    required bool isError,
    required bool dataFetched,
    required bool dataSubmitted,
    MainFailure? failure,
  }) = _CheckinCheckoutState;

  factory CheckinCheckoutState.initial() => const CheckinCheckoutState(
    checkinmodel: null,
    isLoading: false,
    isError: false,
    dataFetched: false,
    dataSubmitted: false,
    failure: null,
  );
}
