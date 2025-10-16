import 'package:checkin_checkout/data/models/property_model/property_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'property_model_data.g.dart';

@JsonSerializable()
class PropertyModelData {
  List<PropertyModel>? dataset;

  PropertyModelData({this.dataset});

  factory PropertyModelData.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyModelDataToJson(this);
}
