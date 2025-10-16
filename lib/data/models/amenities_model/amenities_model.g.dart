// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amenities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmenitiesModel _$AmenitiesModelFromJson(Map<String, dynamic> json) =>
    AmenitiesModel(
      code: json['code'] as String,
      desc: json['desc'] as String,
      unit: json['unit'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AmenitiesModelToJson(AmenitiesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'desc': instance.desc,
      'unit': instance.unit,
      'qty': instance.qty,
    };
