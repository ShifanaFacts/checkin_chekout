import 'package:json_annotation/json_annotation.dart';

import 'amenities_model.dart';

part 'amenities_model_data.g.dart';

@JsonSerializable()
class AmenitiesModelData {
  List<AmenitiesModel>? dataset;

  AmenitiesModelData({this.dataset});

  factory AmenitiesModelData.fromJson(Map<String, dynamic> json) =>
      _$AmenitiesModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$AmenitiesModelDataToJson(this);
}
