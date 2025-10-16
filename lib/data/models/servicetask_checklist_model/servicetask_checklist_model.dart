import 'package:json_annotation/json_annotation.dart';

part 'servicetask_checklist_model.g.dart';

@JsonSerializable()
class ServiceTaskCheckListModel {
  @JsonKey(name: 'docno')
  String? id;

  @JsonKey(name: 'docdesc')
  String? taskCheckItems;

  @JsonKey(name: 'istaskChecked')
  int? istaskChecked; 
  ServiceTaskCheckListModel({
    required this.id,
    required this.taskCheckItems,
    required this.istaskChecked,
  });

  factory ServiceTaskCheckListModel.fromJson(Map<String, dynamic> json) {
    return _$ServiceTaskCheckListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceTaskCheckListModelToJson(this);
}
