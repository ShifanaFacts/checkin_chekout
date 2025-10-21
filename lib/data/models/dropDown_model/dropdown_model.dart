import 'package:json_annotation/json_annotation.dart';

part 'dropdown_model.g.dart';

@JsonSerializable()
class DropdownModel {
  @JsonKey(name: 'dropdownsByDescription')
  Map<String, List<DropdownItem>>? dropdownsByDescription;

  DropdownModel({this.dropdownsByDescription});

  factory DropdownModel.fromJson(Map<String, dynamic> json) =>
      _$DropdownModelFromJson(json);

  Map<String, dynamic> toJson() => _$DropdownModelToJson(this);
}

@JsonSerializable()
class DropdownItem {
  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'code')
  String? code;

  @JsonKey(name: 'COSTCODE')
  String? childList;

  DropdownItem({this.description, this.code, this.childList});

  factory DropdownItem.fromJson(Map<String, dynamic> json) =>
      _$DropdownItemFromJson(json);

  Map<String, dynamic> toJson() => _$DropdownItemToJson(this);
}
