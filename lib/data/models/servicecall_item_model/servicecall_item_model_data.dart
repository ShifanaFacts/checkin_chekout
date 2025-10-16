import 'package:checkin_checkout/data/models/servicecall_item_model/servicecall_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'servicecall_item_model_data.g.dart';

@JsonSerializable()
class ServiceCallItemModelData {
  List<ServiceCallItemModel>? dataset;

  ServiceCallItemModelData({this.dataset});

  factory ServiceCallItemModelData.fromJson(Map<String, dynamic> json) =>
      _$ServiceCallItemModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCallItemModelDataToJson(this);
}
