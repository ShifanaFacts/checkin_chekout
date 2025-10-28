import 'package:checkin_checkout/data/models/report_model/report_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_time_modelList.g.dart';

@JsonSerializable()
class ReportTimeDataModelList {
  String? TotalTime;
  List<ReportDataModel>? reportModel;

  ReportTimeDataModelList({required this.TotalTime, required this.reportModel});

  factory ReportTimeDataModelList.fromJson(Map<String, dynamic> json) {
    return _$ReportTimeDataModelListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportTimeDataModelListToJson(this);
}
