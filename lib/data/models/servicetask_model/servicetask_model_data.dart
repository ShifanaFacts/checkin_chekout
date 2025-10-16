import 'package:json_annotation/json_annotation.dart';
import 'package:checkin_checkout/data/models/servicetask_model/servicetask_model.dart';

part 'servicetask_model_data.g.dart';

@JsonSerializable()
class ServiceTaskModelData {
  List<ServiceTaskModel> dataset;

  ServiceTaskModelData({
    required this.dataset,
  });

  factory ServiceTaskModelData.fromJson(Map<String, dynamic> json) {
    return _$ServiceTaskModelDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceTaskModelDataToJson(this);
}
