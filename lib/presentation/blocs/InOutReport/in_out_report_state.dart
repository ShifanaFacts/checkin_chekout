part of 'in_out_report_bloc.dart';

@freezed
class InOutReportState with _$InOutReportState {
  const factory InOutReportState({
    ReportTimeDataModelList? inOutTimeReport,
    required bool isLoading,
    required bool isError,
    required bool dataFetched,
    MainFailure? failure,
  }) = _InOutReportState;

  factory InOutReportState.initial() => const InOutReportState(
    inOutTimeReport: null,
    isLoading: false,
    isError: false,
    dataFetched: false,
    failure: null,
  );
}
