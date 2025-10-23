// presentation/blocs/login/login_state.dart
part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required UserDataModel? userDataModel,
    required bool isLoading,
    required bool isError,
    required bool loginSucceeded,
    required bool deviceValidation,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
    userDataModel: null,
    isLoading: false,
    isError: false,
    loginSucceeded: false,
    deviceValidation: false,
  );
}
