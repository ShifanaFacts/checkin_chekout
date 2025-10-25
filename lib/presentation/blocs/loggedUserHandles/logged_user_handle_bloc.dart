import 'package:bloc/bloc.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/loggedUserHandleRepo.dart';
import 'package:checkin_checkout/data/models/dashboard_model/dashboard_model.dart';
import 'package:checkin_checkout/data/models/dropDown_model/dropdown_model.dart';
import 'package:checkin_checkout/data/models/logged_user_data_mode.dart/loggedUser_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer';

part 'logged_user_handle_event.dart';
part 'logged_user_handle_state.dart';
part 'logged_user_handle_bloc.freezed.dart';

@injectable
class LoggedUserHandleBloc
    extends Bloc<LoggedUserHandleEvent, LoggedUserHandleState> {
  final Loggeduserhandlerepo _loggedUserDetailsService;

  LoggedUserHandleBloc(this._loggedUserDetailsService)
    : super(LoggedUserHandleState.initial()) {
    log('Initializing LoggedUserHandleBloc');

    on<GetLoggedUserDetails>((event, emit) async {
      emit(state.copyWith(isUserLoading: true, isError: false, failure: null));

      final result = await _loggedUserDetailsService.getLoggedUserDetails(
        event.lat,
        event.long,
      );

      result.fold(
        (MainFailure failure) => emit(
          state.copyWith(
            isUserLoading: false,
            isError: true,
            dataFetched: false,
            failure: failure,
          ),
        ),
        (LoggedUserModel userDataModel) => emit(
          state.copyWith(
            loggedUserModel: userDataModel,
            isUserLoading: false,
            isError: false,
            dataFetched: true,
            failure: null,
          ),
        ),
      );
    });

    on<GetDropDownData>((event, emit) async {
      emit(
        state.copyWith(isDropdownLoading: true, isError: false, failure: null),
      );

      final result = await _loggedUserDetailsService.getDropDownData(
        event.strDocType,
        event.description,
        event.lat,
        event.long,
      );

      result.fold(
        (MainFailure failure) => emit(
          state.copyWith(
            isDropdownLoading: false,
            isError: true,
            dataFetched: false,
            failure: failure,
          ),
        ),
        (DropdownModel newDropdownModel) {
          // Merge new dropdown data with existing data
          final currentDropdowns =
              state.dropdownModel?.dropdownsByDescription ?? {};
          if (newDropdownModel.dropdownsByDescription != null) {
            currentDropdowns.addAll(newDropdownModel.dropdownsByDescription!);
          }
          log(
            'Merged dropdownsByDescription: ${currentDropdowns.keys.toList()}',
          );

          emit(
            state.copyWith(
              dropdownModel: DropdownModel(
                dropdownsByDescription: currentDropdowns,
              ),
              isDropdownLoading: false,
              isError: false,
              dataFetched: true,
              failure: null,
            ),
          );
        },
      );
    });

    on<GetDashboardList>((event, emit) async {
      emit(
        state.copyWith(isDashboardLoading: true, isError: false, failure: null),
      );
      final result = await _loggedUserDetailsService.getDashboardList();
      result.fold(
        (MainFailure failure) => emit(
          state.copyWith(
            isDashboardLoading: false,
            isError: true,
            dataFetched: false,
            failure: failure,
          ),
        ),
        (DashboardModel dashboardModel) => emit(
          state.copyWith(
            dashboardModel: dashboardModel,
            isDashboardLoading: false,
            isError: false,
            dataFetched: true,
            failure: null,
          ),
        ),
      );
    });
    // ---------
    on<ClearDropdownData>((event, emit) {
      emit(state.copyWith(dropdownModel: null));
    });

    // In the bloc's event handler
  }
}
