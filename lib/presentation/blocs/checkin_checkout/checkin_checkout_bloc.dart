import 'package:bloc/bloc.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/checkin_checkout_repo.dart';
import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'checkin_checkout_event.dart';
part 'checkin_checkout_state.dart';
part 'checkin_checkout_bloc.freezed.dart';

@injectable
class CheckinCheckoutBloc
    extends Bloc<CheckinCheckoutEvent, CheckinCheckoutState> {
  final CheckinCheckoutRepo _checkinCheckoutService;

  CheckinCheckoutBloc(this._checkinCheckoutService)
    : super(CheckinCheckoutState.initial()) {
    on<GetCheckinData>((event, emit) async {
      emit(
        state.copyWith(
          checkinmodel: null,
          isLoading: true,
          isError: false,
          dataSubmitted: false,
          dataFetched: false,
        ),
      );

      final result = await _checkinCheckoutService.getCheckinData(
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
        ),
        (CheckinVieModel userCheckinModel) => state.copyWith(
          checkinmodel: userCheckinModel,
          isLoading: false,
          isError: false,
          dataSubmitted: true,
          dataFetched: true, // Set to true for successful fetch
        ),
      );

      emit(newState);
    });
  }
}
