import 'package:json_annotation/json_annotation.dart';

import 'Servicezonefilter_model.dart';

part 'Servicezonefilter_modeldata.g.dart';

@JsonSerializable()
class ServiceZoneFilterModelData {
  List<ServiceZoneFilterModel>? dataset;

  ServiceZoneFilterModelData({this.dataset});

  factory ServiceZoneFilterModelData.fromJson(Map<String, dynamic> json) =>
      _$ServiceZoneFilterModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceZoneFilterModelDataToJson(this);
}
