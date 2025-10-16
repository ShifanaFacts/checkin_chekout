// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicetype_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTypeModel _$ServiceTypeModelFromJson(Map<String, dynamic> json) =>
    ServiceTypeModel(
      code: json['code'] as String,
      desc: json['desc'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AmenitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceTypeModelToJson(ServiceTypeModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'desc': instance.desc,
      'attachments': instance.attachments,
    };
