import 'package:json_annotation/json_annotation.dart';
import 'package:checkin_checkout/data/models/reporting_model/reporting_model.dart';

part 'reporting_model_data.g.dart';

@JsonSerializable()
class ReportingModelData {
  List<Reportingmodel>? dataset;

  ReportingModelData({this.dataset});

  factory ReportingModelData.fromJson(Map<String, dynamic> json) =>
      _$ReportingModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReportingModelDataToJson(this);
}
