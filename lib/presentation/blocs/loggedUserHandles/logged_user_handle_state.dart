part of 'logged_user_handle_bloc.dart';

@freezed
class LoggedUserHandleState with _$LoggedUserHandleState {
  const factory LoggedUserHandleState({
    LoggedUserModel? loggedUserModel,
    DropdownModel? dropdownModel,
    required bool isLoading,
    required bool isError,
    required bool dataFetched,
    MainFailure? failure,
  }) = _LoggedUserHandleState;

  factory LoggedUserHandleState.initial() => const LoggedUserHandleState(
    loggedUserModel: null,
    dropdownModel: null,
    isLoading: false,
    isError: false,
    dataFetched: false,
    failure: null,
  );
}
