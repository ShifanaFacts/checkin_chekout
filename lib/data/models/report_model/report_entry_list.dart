import 'package:checkin_checkout/data/models/report_model/report_entry_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_entry_list.g.dart';

@JsonSerializable()
class ReportEntryModelList {
  List<ReportEntryModel>? dataset;

  ReportEntryModelList({this.dataset});

  factory ReportEntryModelList.fromJson(Map<String, dynamic> json) =>
      _$ReportEntryModelListFromJson(json);

  Map<String, dynamic> toJson() => _$ReportEntryModelListToJson(this);
}
