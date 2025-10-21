part of 'logged_user_handle_bloc.dart';

@freezed
class LoggedUserHandleEvent with _$LoggedUserHandleEvent {
  const factory LoggedUserHandleEvent.initialize() = Initialize;
  const factory LoggedUserHandleEvent.getLoggedUserDetails({
    required double lat,
    required double long,
  }) = GetLoggedUserDetails;
  const factory LoggedUserHandleEvent.getDropDownData({
    String? strDocType,
    String? description,
    double? lat,
    double? long,
  }) = GetDropDownData;
  const factory LoggedUserHandleEvent.getAllDropdownData() = GetAllDropdownData;
  const factory LoggedUserHandleEvent.getDashboardList() = GetDashboardList;
}
