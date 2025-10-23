// presentation/blocs/login/login_bloc.dart
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/loginRepo.dart';
import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';
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
    on<Initialize>((_, emit) => emit(LoginState.initial()));

    on<PerformUserLogout>((event, emit) async {
      await _loginService.performLogout(event.context);
    });

    on<PerformLogin>((event, emit) async {
      // Step 1: Show loading
      emit(
        const LoginState(
          userDataModel: null,
          isLoading: true,
          isError: false,
          loginSucceeded: false,
          deviceValidation: false,
        ),
      );

      log('Starting login for ${event.logingId}');

      // Step 2: Perform login
      final loginResult = await _loginService.performLogin(
        event.logingId,
        event.password,
      );

      // Step 3: Chain user details only if login succeeded
      final nextState = await loginResult.fold(
        (failure) async => LoginState(
          userDataModel: null,
          isLoading: false,
          isError: true,
          loginSucceeded: false,
          deviceValidation: false,
        ),
        (_) async {
          // Login OK → fetch user details
          final userResult = await _loginService.getUserDetails();

          return userResult.fold(
            (userFailure) => LoginState(
              userDataModel: null,
              isLoading: false,
              isError: true,
              loginSucceeded: false,
              deviceValidation: false,
            ),
            (userData) => LoginState(
              userDataModel: userData,
              isLoading: false,
              isError: false,
              loginSucceeded: true,
              deviceValidation: true,
            ),
          );
        },
      );

      emit(await nextState);
    });
  }
}
