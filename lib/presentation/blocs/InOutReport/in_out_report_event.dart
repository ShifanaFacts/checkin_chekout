part of 'in_out_report_bloc.dart';

@freezed
class InOutReportEvent with _$InOutReportEvent {
  const factory InOutReportEvent.started() = _Started;
  const factory InOutReportEvent.getReportList({
    required String ReportType,
    required String fmdate,
    required String todate,
  }) = GetInoutReport;
}
