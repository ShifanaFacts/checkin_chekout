part of 'user_checkin_checkout_bloc.dart';

@freezed
class UserCheckinCheckoutState with _$UserCheckinCheckoutState {
  const factory UserCheckinCheckoutState({
    CheckinModel? checkinmodel,
    CheckinVieModel? checkinViewmodel,
    required bool isLoading,
    required bool isError,
    required bool dataFetched,
    required bool dataSubmitted,
    required bool checkedIn,

    MainFailure? failure,
  }) = _UserCheckinCheckoutState;

  factory UserCheckinCheckoutState.initial() => const UserCheckinCheckoutState(
    checkinmodel: null,
    checkinViewmodel: null,
    isLoading: false,
    isError: false,
    dataFetched: false,
    dataSubmitted: false,
    checkedIn: false,
    failure: null,
  );
}
