import 'package:checkin_checkout/data/models/valueobjectmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reporting_model.g.dart';

@JsonSerializable()
class Reportingmodel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'reporting_value')
  String? reporting_value;
  @JsonKey(name: 'reporting_fields')
  String? reporting_fields;

  Reportingmodel({
    required this.id,
    required this.reporting_value,
    required this.reporting_fields,
  });

  factory Reportingmodel.fromJson(Map<String, dynamic> json) {
    return _$ReportingmodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportingmodelToJson(this);
}
