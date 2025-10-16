import 'package:json_annotation/json_annotation.dart';
import 'package:checkin_checkout/data/models/servicetask_checklist_model/servicetask_checklist_model.dart';

part 'servicetask_checklist_model_data.g.dart';

@JsonSerializable()
class ServiceTaskCheckListModelData {
  List<ServiceTaskCheckListModel> dataset;

  ServiceTaskCheckListModelData({
    required this.dataset,
  });

  factory ServiceTaskCheckListModelData.fromJson(Map<String, dynamic> json) =>
      _$ServiceTaskCheckListModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceTaskCheckListModelDataToJson(this);
}
