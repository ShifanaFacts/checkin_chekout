import 'package:json_annotation/json_annotation.dart';

import 'servicetype_model.dart';

part 'servicetype_modeldata.g.dart';

@JsonSerializable()
class ServiceTypeModelData {
  List<ServiceTypeModel>? dataset;

  ServiceTypeModelData({this.dataset});

  factory ServiceTypeModelData.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceTypeModelDataToJson(this);
}
