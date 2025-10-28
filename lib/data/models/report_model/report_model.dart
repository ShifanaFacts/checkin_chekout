import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportDataModel {
  String? employeename;
  String? desig_desc;
  String? project;
  String? department;
  String? activity;
  String? checkInTime;
  String? checkOutTime;
  double? TotalHours;
  String? effectivedate;

  ReportDataModel({
    required this.checkInTime,
    required this.checkOutTime,
    required this.project,
    required this.department,
    required this.activity,
    required this.employeename,
    required this.desig_desc,
    required this.TotalHours,
    required this.effectivedate,
  });

  factory ReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDataModelToJson(this);

  // ✅ Formatted getters
}
