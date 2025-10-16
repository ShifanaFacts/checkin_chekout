import 'package:checkin_checkout/data/models/amenities_model/amenities_model.dart';
import 'package:checkin_checkout/data/models/valueobjectmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Servicezonefilter_model.g.dart';

@JsonSerializable()
class ServiceZoneFilterModel {
  @JsonKey(name: 'ZoneName')
  String? ZoneName;

  ServiceZoneFilterModel({required this.ZoneName});

  factory ServiceZoneFilterModel.fromJson(Map<String, dynamic> json) {
    return _$ServiceZoneFilterModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceZoneFilterModelToJson(this);
}
