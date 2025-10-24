import 'package:bloc/bloc.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/checkin_checkout_repo.dart';
import 'package:checkin_checkout/core/repository/loggedUserHandleRepo.dart';
import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_model.dart';
import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_view_model.dart';
import 'package:checkin_checkout/data/models/dashboard_model/dashboard_model.dart';
import 'package:checkin_checkout/data/models/dropDown_model/dropdown_model.dart';
import 'package:checkin_checkout/data/models/logged_user_data_mode.dart/loggedUser_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer';

part 'user_checkin_checkout_event.dart';
part 'user_checkin_checkout_state.dart';
part 'user_checkin_checkout_bloc.freezed.dart';

@injectable
class UserCheckinCheckoutBloc
    extends Bloc<UserCheckinCheckoutEvent, UserCheckinCheckoutState> {
  final CheckinCheckoutRepo _checkincheckoutService;

  UserCheckinCheckoutBloc(this._checkincheckoutService)
    : super(UserCheckinCheckoutState.initial()) {
    log('Initializing LoggedUserHandleBloc');

    on<GetCheckinData>((event, emit) async {
      emit(
        state.copyWith(
          checkinmodel: null,
          isLoading: true,
          isError: false,
          dataSubmitted: false,
          dataFetched: false,
          checkedIn: false,
        ),
      );

      final result = await _checkincheckoutService.getCheckinData(
        event.lat,
        event.long,
        event.dropDownSelectionObject,
        event.checkinTime,
      );

      final newState = result.fold(
        (MainFailure failure) => state.copyWith(
          checkinmodel: null,
          isLoading: false,
          isError: true,
          dataSubmitted: false,
          dataFetched: false,
          checkedIn: false,
        ),
        (CheckinModel userCheckinModel) => state.copyWith(
          checkinmodel: userCheckinModel,
          isLoading: false,
          isError: false,
          dataSubmitted: true,
          dataFetched: true,
          checkedIn: true,
        ),
      );

      emit(newState);
    });
    // ---------------------------------
    on<GetCheckOutData>((event, emit) async {
      emit(
        state.copyWith(
          checkinmodel: null,
          isLoading: true,
          isError: false,
          dataSubmitted: false,
          dataFetched: false,
          checkedIn: false,
        ),
      );

      final result = await _checkincheckoutService.getCheckOutData(
        event.lat,
        event.long,
        event.checkinTime,
      );

      final newState = result.fold(
        (MainFailure failure) => state.copyWith(
          checkinmodel: null,
          isLoading: false,
          isError: true,
          dataSubmitted: false,
          dataFetched: false,
          checkedIn: false,
        ),
        (CheckinVieModel userCheckinModel) => state.copyWith(
          checkinmodel: null,
          isLoading: false,
          isError: false,
          dataSubmitted: true,
          dataFetched: true,
          checkedIn: false,
        ),
      );

      emit(newState);
    });
  }
}
