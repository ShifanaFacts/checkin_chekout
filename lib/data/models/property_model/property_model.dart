import 'package:json_annotation/json_annotation.dart';

part 'property_model.g.dart';

@JsonSerializable()
class PropertyModel {
  @JsonKey(name: 'Type')
  String? type;
  @JsonKey(name: 'Code')
  String? code;
  @JsonKey(name: 'Name')
  String? name;
  @JsonKey(name: 'Area')
  String? area;
  @JsonKey(name: 'PropertyType')
  String? propertyType;
  @JsonKey(name: 'PTypeCode')
  String? ptypecode;
  @JsonKey(name: 'Apartments')
  String? apartments;
  @JsonKey(name: 'Zone')
  String? zone;
  @JsonKey(name: 'Location')
  String? location;
  @JsonKey(name: 'PId')
  String? pid;

  PropertyModel({
    this.type,
    this.code,
    this.name,
    this.area,
    this.propertyType,
    this.ptypecode,
    this.apartments,
    this.zone,
    this.location,
    this.pid,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return _$PropertyModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
}
