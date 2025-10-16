// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicetask_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTaskModel _$ServiceTaskModelFromJson(Map<String, dynamic> json) =>
    ServiceTaskModel(
      name: json['tmp_name'] as String?,
      imageType: json['tmp_imageType'] as String?,
      attkey: json['tmp_attkey'] as String?,
      uploadTime: json['tmp_uploadTime'] == null
          ? null
          : DateTime.parse(json['tmp_uploadTime'] as String),
      imagePath: json['tmp_imagePath'] as String?,
    );

Map<String, dynamic> _$ServiceTaskModelToJson(ServiceTaskModel instance) =>
    <String, dynamic>{
      'tmp_name': instance.name,
      'tmp_imageType': instance.imageType,
      'tmp_attkey': instance.attkey,
      'tmp_uploadTime': instance.uploadTime?.toIso8601String(),
      'tmp_imagePath': instance.imagePath,
    };
