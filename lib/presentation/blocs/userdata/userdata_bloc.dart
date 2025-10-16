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
    on<PostUserFCMToken>((event, emit) async {
      log('Performing PostUserFCMToken');

      final result = await _userDetailsService.postUserFCMToken(
        event.logingId,
        event.token,
      );

      result.fold(
        (MainFailure failure) {
          return "";
        },
        (String result) {
          return result;
        },
      );

      emit(state);
    });

    // on<GetFcmToken>(
    //   (event, emit) async {
    //     log('Performing GetFcmToken');

    //     final result =
    //         await _userDetailsService.getUserFCMToken(event.logingId);

    //     final state = result.fold(
    //       (MainFailure failure) {
    //         return "";
    //       },
    //       (String result) {
    //         return result;
    //       },
    //     );

    //     emit(event.);
    //   },
    // );

    on<GetUserData>((event, emit) async {
      emit(
        const UserdataState(
          userModel: null,
          isLoading: true,
          isError: false,
          datafetched: false,
          btmNavitems: [],
          screens: [],
        ),
      );

      log('Performing user data fetch');

      final result = await _userDetailsService.getUserDetails(event!.logingId);

      final state = result.fold(
        (MainFailure failure) {
          return const UserdataState(
            userModel: null,
            isLoading: false,
            isError: true,
            datafetched: false,
            btmNavitems: [],
            screens: [],
          );
        },
        (UserDataModel userdatamodel) {
          return UserdataState(
            userModel: userdatamodel,
            isLoading: false,
            isError: false,
            datafetched: true,
            btmNavitems: generateBottomNavigationBarItems(userdatamodel),
            screens: generateScreenList(userdatamodel),
          );
        },
      );

      emit(state);
    });
  }
}

generateBottomNavigationBarItems(UserDataModel userdatamodel) {
  // Generate items based on user details
  // Example:
  if (userdatamodel.usertype == 'customer') {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.cleaning_services),
        label: 'Services',
      ),

      // BottomNavigationBarItem(
      //   icon: Icon(Icons.room_service),
      //   label: 'Services',
      // ),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
    ];
  } else if (userdatamodel.usertype == 'crew') {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.cleaning_services),
        label: 'Services',
      ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.home),
      //   label: 'Tasks',
      // ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.account_box),
      //   label: 'Uniforms',
      // ),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
    ];
  } else if (userdatamodel.usertype == 'driver') {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Schedule'),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month),
        label: 'Calender',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
    ];
  } else if (userdatamodel.usertype == 'supervisor') {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.cleaning_services),
        label: 'Service',
      ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.account_box),
      //   label: 'Driver',
      // ),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
    ];
  }
}

generateScreenList(UserDataModel userdatamodel) {
  // Generate items based on user details
  // Example:
  if (userdatamodel.usertype == 'customer') {
    return const [
      // HomeAdvertisePage(),
      UserAccountScreen(),
    ];
  } else if (userdatamodel.usertype == 'crew') {
    return const [
      // TaskListScreen(),
      // UniformRequestListScreen(),
      UserAccountScreen(),
    ];
  } else if (userdatamodel.usertype == 'driver') {
    return const [UserAccountScreen()];
  } else if (userdatamodel.usertype == 'supervisor') {
    return const [
      // UniformRequestListScreen(),
      UserAccountScreen(),
    ];
  }
}
