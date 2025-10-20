part of 'userdata_bloc.dart';

@freezed
class UserdataState with _$UserdataState {
  const factory UserdataState({
    UserDataModel? userModel,
    DropdownModel? dropdownModel,
    required bool isLoading,
    required bool isError,
    required bool datafetched,
    MainFailure? failure,
  }) = _UserdataState;

  factory UserdataState.initial() => const UserdataState(
    userModel: null,
    isLoading: false,
    isError: false,
    datafetched: false,
    failure: null,
  );
}
