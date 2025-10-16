import 'package:checkin_checkout/data/models/reporting_category_model/reporting_category_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:checkin_checkout/data/models/reporting_model/reporting_model.dart';

part 'reporting_category_model_data.g.dart';

@JsonSerializable()
class ReportingCategoryModelData {
  List<ReportingCategorymodel>? dataset;

  ReportingCategoryModelData({this.dataset});

  factory ReportingCategoryModelData.fromJson(Map<String, dynamic> json) =>
      _$ReportingCategoryModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReportingCategoryModelDataToJson(this);
}
