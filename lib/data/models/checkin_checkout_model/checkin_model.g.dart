// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckinModel _$CheckinModelFromJson(Map<String, dynamic> json) => CheckinModel(
  checkintime: json['checkintime'] as String?,
  checkintimedesc: json['checkintimedesc'] as String?,
  status: json['status'] as bool?,
  empdocno: json['empdocno'] as String?,
);

Map<String, dynamic> _$CheckinModelToJson(CheckinModel instance) =>
    <String, dynamic>{
      'checkintime': instance.checkintime,
      'checkintimedesc': instance.checkintimedesc,
      'status': instance.status,
      'empdocno': instance.empdocno,
    };
