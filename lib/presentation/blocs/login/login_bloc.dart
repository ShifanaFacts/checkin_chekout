import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/loginRepo.dart';
import 'package:checkin_checkout/data/models/login_model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo _loginService;

  LoginBloc(this._loginService) : super(LoginState.initial()) {
    on<Initialize>((event, emit) {});

    on<PerformUserLogout>((event, emit) async {
      await _loginService.performLogout(event.context);
    });

    on<PerformLogin>((event, emit) async {
      emit(
        const LoginState(
          loginModel: null,
          isLoading: true,
          isError: false,
          loginSucceeded: false,
          deviceValidation: false,
        ),
      );

      log('Performing Login');

      final result = await _loginService.performLogin(
        event.logingId,
        event.password,
      );

      final state = result.fold(
        (MainFailure failure) {
          return const LoginState(
            loginModel: null,
            isLoading: false,
            isError: true,
            loginSucceeded: false,
            deviceValidation: false,
          );
        },
        (LoginModel loginmodel) {
          return LoginState(
            loginModel: loginmodel,
            isLoading: false,
            isError: false,
            loginSucceeded: true,
            deviceValidation: true,
          );
        },
      );

      emit(state);
    });
  }
}
