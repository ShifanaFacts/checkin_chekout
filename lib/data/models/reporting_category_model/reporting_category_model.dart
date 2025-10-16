import 'package:checkin_checkout/data/models/valueobjectmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reporting_category_model.g.dart';

@JsonSerializable()
class ReportingCategorymodel {
  @JsonKey(name: 'remarks')
  String? remarks;
  @JsonKey(name: 'Image_data')
  String? Image_data;
  @JsonKey(name: 'docno')
  String? docno;

  ReportingCategorymodel(
      {required this.remarks, required this.Image_data, required this.docno});

  factory ReportingCategorymodel.fromJson(Map<String, dynamic> json) {
    return _$ReportingCategorymodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportingCategorymodelToJson(this);
}
