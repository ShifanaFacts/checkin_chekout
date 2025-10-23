part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.initialize() = Initialize;
  const factory LoginEvent.performLogin({
    required String logingId,
    required String password,
  }) = PerformLogin;
  const factory LoginEvent.performUserLogout({required BuildContext context}) =
      PerformUserLogout;
}
