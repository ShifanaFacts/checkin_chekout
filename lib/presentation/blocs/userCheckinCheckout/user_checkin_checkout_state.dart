part of 'user_checkin_checkout_bloc.dart';

@freezed
class UserCheckinCheckoutState with _$UserCheckinCheckoutState {
  const factory UserCheckinCheckoutState({
    CheckinVieModel? checkinmodel,
    required bool isLoading,
    required bool isError,
    required bool dataFetched,
    required bool dataSubmitted,
    required bool checkedIn,
    MainFailure? failure,
  }) = _UserCheckinCheckoutState;

  factory UserCheckinCheckoutState.initial() => const UserCheckinCheckoutState(
    checkinmodel: null,
    isLoading: false,
    isError: false,
    dataFetched: false,
    dataSubmitted: false,
    checkedIn: false,
    failure: null,
  );
}
