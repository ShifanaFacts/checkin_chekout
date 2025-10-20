import 'package:bloc/bloc.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/loggedUserHandleRepo.dart';
import 'package:checkin_checkout/data/models/dropDown_model/dropdown_model.dart';
import 'package:checkin_checkout/data/models/logged_user_data_mode.dart/loggedUser_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'logged_user_handle_event.dart';
part 'logged_user_handle_state.dart';
part 'logged_user_handle_bloc.freezed.dart';

@injectable
class LoggedUserHandleBloc
    extends Bloc<LoggedUserHandleEvent, LoggedUserHandleState> {
  final Loggeduserhandlerepo _loggedUserDetailsService;

  LoggedUserHandleBloc(this._loggedUserDetailsService)
    : super(LoggedUserHandleState.initial()) {
    // 🔹 Get logged user details
    on<GetLoggedUserDetails>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false, failure: null));

      final result = await _loggedUserDetailsService.getLoggedUserDetails(
        event.lat,
        event.long,
      );

      result.fold(
        (MainFailure failure) => emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            dataFetched: false,
            failure: failure,
          ),
        ),
        (LoggedUserModel userDataModel) => emit(
          state.copyWith(
            loggedUserModel: userDataModel,
            isLoading: false,
            isError: false,
            dataFetched: true,
          ),
        ),
      );
    });
    // ---------------------------------------------------------------------------------------------
    // 🔹 Get dropdown data (single)
    on<GetDropDownData>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false, failure: null));

      final result = await _loggedUserDetailsService.getDropDownData(
        event.strDocType,
        event.description,
      );

      result.fold(
        (MainFailure failure) => emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            dataFetched: false,
            failure: failure,
          ),
        ),
        (DropdownModel dropdownModel) => emit(
          state.copyWith(
            dropdownModel: dropdownModel,
            isLoading: false,
            isError: false,
            dataFetched: true,
          ),
        ),
      );
    });
    // ------------------------------------------------------------------------------------
    // 🔹 Get all dropdown data
    on<GetAllDropdownData>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false, failure: null));

      final result = await _loggedUserDetailsService.getAllDropdownData();

      result.fold(
        (MainFailure failure) => emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            dataFetched: false,
            failure: failure,
          ),
        ),
        (DropdownModel dropdownModel) => emit(
          state.copyWith(
            dropdownModel: dropdownModel,
            isLoading: false,
            isError: false,
            dataFetched: true,
          ),
        ),
      );
    });
  }
}
