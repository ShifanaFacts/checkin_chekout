import 'package:json_annotation/json_annotation.dart';

part 'report_entry_model.g.dart';

@JsonSerializable()
class ReportEntryModel {
  String? type;
  String? createdby;
  DateTime? createdts;
  String? remarks;
  List<String>? attachments;

  ReportEntryModel(
      {required this.type,
      required this.createdby,
      required this.createdts,
      required this.remarks,
      this.attachments});

  factory ReportEntryModel.fromJson(Map<String, dynamic> json) {
    return _$ReportEntryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportEntryModelToJson(this);
}
