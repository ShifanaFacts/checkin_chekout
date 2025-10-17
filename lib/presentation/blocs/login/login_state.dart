part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    LoginModel? loginModel,
    required bool isLoading,
    required bool isError,
    required bool loginSucceeded,
    required bool deviceValidation,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
    loginModel: null,
    isLoading: false,
    isError: false,
    loginSucceeded: false,
    deviceValidation: true,
  );
}
