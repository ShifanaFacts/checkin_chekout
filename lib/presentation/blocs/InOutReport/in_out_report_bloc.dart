import 'package:bloc/bloc.dart';
import 'package:checkin_checkout/core/exceptions/failures/main_failure.dart';
import 'package:checkin_checkout/core/repository/reportrepo.dart';
import 'package:checkin_checkout/data/models/report_model/report_time_modelList.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'in_out_report_event.dart';
part 'in_out_report_state.dart';
part 'in_out_report_bloc.freezed.dart';

@injectable
class InOutReportBloc extends Bloc<InOutReportEvent, InOutReportState> {
  final ReportRepo _InOutRepoService;

  InOutReportBloc(this._InOutRepoService) : super(InOutReportState.initial()) {
    on<GetInoutReport>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false, failure: null));

      final result = await _InOutRepoService.getReportList(
        event.ReportType,
        event.fmdate,
        event.todate,
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
        (ReportTimeDataModelList inOutTimeReportList) => emit(
          state.copyWith(
            inOutTimeReport: inOutTimeReportList,
            isLoading: false,
            isError: false,
            dataFetched: true,
            failure: null,
          ),
        ),
      );
    });
  }
}
