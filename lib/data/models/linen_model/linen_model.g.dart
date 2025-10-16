// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinenModel _$LinenModelFromJson(Map<String, dynamic> json) => LinenModel(
  code: json['code'] as String,
  desc: json['desc'] as String,
  unit: json['unit'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
);

Map<String, dynamic> _$LinenModelToJson(LinenModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'desc': instance.desc,
      'unit': instance.unit,
      'qty': instance.qty,
    };
