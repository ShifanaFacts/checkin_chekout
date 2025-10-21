// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropdownModel _$DropdownModelFromJson(Map<String, dynamic> json) =>
    DropdownModel(
      dropdownsByDescription:
          (json['dropdownsByDescription'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              (e as List<dynamic>)
                  .map((e) => DropdownItem.fromJson(e as Map<String, dynamic>))
                  .toList(),
            ),
          ),
    );

Map<String, dynamic> _$DropdownModelToJson(DropdownModel instance) =>
    <String, dynamic>{
      'dropdownsByDescription': instance.dropdownsByDescription,
    };

DropdownItem _$DropdownItemFromJson(Map<String, dynamic> json) => DropdownItem(
  description: json['description'] as String?,
  code: json['code'] as String?,
  childList: json['COSTCODE'] as String?,
);

Map<String, dynamic> _$DropdownItemToJson(DropdownItem instance) =>
    <String, dynamic>{
      'description': instance.description,
      'code': instance.code,
      'COSTCODE': instance.childList,
    };
