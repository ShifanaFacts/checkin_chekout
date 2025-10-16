// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    PropertyModel(
      type: json['Type'] as String?,
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      area: json['Area'] as String?,
      propertyType: json['PropertyType'] as String?,
      ptypecode: json['PTypeCode'] as String?,
      apartments: json['Apartments'] as String?,
      zone: json['Zone'] as String?,
      location: json['Location'] as String?,
      pid: json['PId'] as String?,
    );

Map<String, dynamic> _$PropertyModelToJson(PropertyModel instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Code': instance.code,
      'Name': instance.name,
      'Area': instance.area,
      'PropertyType': instance.propertyType,
      'PTypeCode': instance.ptypecode,
      'Apartments': instance.apartments,
      'Zone': instance.zone,
      'Location': instance.location,
      'PId': instance.pid,
    };
