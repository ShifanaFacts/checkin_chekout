// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amineties_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AminetiesModel _$AminetiesModelFromJson(Map<String, dynamic> json) =>
    AminetiesModel(
      code: json['code'] as String,
      desc: json['desc'] as String,
      unit: json['unit'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AminetiesModelToJson(AminetiesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'desc': instance.desc,
      'unit': instance.unit,
      'qty': instance.qty,
    };
