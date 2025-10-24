import 'package:bloc/bloc.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/checkin_checkout_repo.dart';
import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'checkin_details_event.dart';
part 'checkin_details_state.dart';
part 'checkin_details_bloc.freezed.dart';

@injectable
class CheckinDetailsBloc
    extends Bloc<CheckinDetailsEvent, CheckinDetailsState> {
  final CheckinCheckoutRepo _checkincheckoutService;

  CheckinDetailsBloc(this._checkincheckoutService)
    : super(CheckinDetailsState.initial()) {
    // ---------------------------------------------------------------------------
    on<GetCheckInDetails>((event, emit) async {
      emit(
        CheckinDetailsState(
          checkinViewmodel: null,
          isLoading: true,
          isError: false,
          dataSubmitted: false,
          dataFetched: false,
          checkedIn: false,
        ),
      );

      final result = await _checkincheckoutService.getTechnicianCheckInDetails(
        event.lat,
        event.long,
        event.checkinTime,
      );

      final newState = result.fold(
        (MainFailure failure) => CheckinDetailsState(
          checkinViewmodel: null,
          isLoading: false,
          isError: true,
          dataSubmitted: false,
          dataFetched: false,
          checkedIn: false,
        ),
        (CheckinVieModel userCheckinModel) => CheckinDetailsState(
          checkinViewmodel: userCheckinModel,
          isLoading: false,
          isError: false,
          dataSubmitted: true,
          dataFetched: true,
          checkedIn: true,
        ),
      );

      emit(newState);
    });
  }
}
