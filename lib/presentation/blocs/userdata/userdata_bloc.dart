import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/userrepo.dart';
import 'package:checkin_checkout/data/models/user_data_model/user_data_model.dart';
import 'package:checkin_checkout/presentation/screens/userAccount/userAccountScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'userdata_event.dart';
part 'userdata_state.dart';
part 'userdata_bloc.freezed.dart';

@injectable
class UserdataBloc extends Bloc<UserdataEvent, UserdataState> {
  final UserDetailRepo _userDetailsService;

  UserdataBloc(this._userDetailsService) : super(UserdataState.initial()) {
    on<GetUserData>((event, emit) async {
      emit(
        const UserdataState(
          userModel: null,
          isLoading: true,
          isError: false,
          datafetched: false,
        ),
      );

      final result = await _userDetailsService.getUserDetails();

      final state = result.fold(
        (MainFailure failure) {
          return UserdataState(
            userModel: null,
            isLoading: false,
            isError: true,
            datafetched: false,
            failure: failure,
          );
        },
        (UserDataModel userdatamodel) {
          return UserdataState(
            userModel: userdatamodel,
            isLoading: false,
            isError: false,
            datafetched: true,
            failure: null,
          );
        },
      );

      emit(state);
    });
  }
}
