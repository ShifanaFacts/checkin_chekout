part of 'checkin_details_bloc.dart';

@freezed
class CheckinDetailsState with _$CheckinDetailsState {
  const factory CheckinDetailsState({
    CheckinVieModel? checkinViewmodel,
    required bool isLoading,
    required bool isError,
    required bool dataFetched,
    required bool dataSubmitted,
    required bool checkedIn,
    MainFailure? failure,
  }) = _CheckinDetailsState;

  factory CheckinDetailsState.initial() => const CheckinDetailsState(
    checkinViewmodel: null,
    isLoading: false,
    isError: false,
    dataFetched: false,
    dataSubmitted: false,
    checkedIn: false,
    failure: null,
  );
}
