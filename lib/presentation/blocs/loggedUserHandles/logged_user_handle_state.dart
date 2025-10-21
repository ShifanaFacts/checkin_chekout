part of 'logged_user_handle_bloc.dart';

@freezed
class LoggedUserHandleState with _$LoggedUserHandleState {
  const factory LoggedUserHandleState({
    required bool isUserLoading,
    required bool isDashboardLoading,
    required bool isDropdownLoading,
    required bool isError,
    required bool dataFetched,
    MainFailure? failure,
    LoggedUserModel? loggedUserModel,
    DashboardModel? dashboardModel,
    DropdownModel? dropdownModel,
  }) = _LoggedUserHandleState;

  factory LoggedUserHandleState.initial() => const LoggedUserHandleState(
    isUserLoading: false,
    isDashboardLoading: false,
    isDropdownLoading: false,
    isError: false,
    dataFetched: false,
    failure: null,
    loggedUserModel: null,
    dashboardModel: null,
    dropdownModel: null,
  );
}
