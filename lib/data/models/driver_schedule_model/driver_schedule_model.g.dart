// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverScheduleModel _$DriverScheduleModelFromJson(Map<String, dynamic> json) =>
    DriverScheduleModel(
      serviceTime: json['tmp_docdate'] as String?,
      location: json['tmp_location'] as String?,
      pickupTime: json['pickupTime'] as String?,
      dropoffTime: json['dropoffTime'] as String?,
      status: json['status'] as String?,
      crewName: json['tmp_crew_name'] as String?,
    );

Map<String, dynamic> _$DriverScheduleModelToJson(
  DriverScheduleModel instance,
) => <String, dynamic>{
  'tmp_docdate': instance.serviceTime,
  'tmp_location': instance.location,
  'pickupTime': instance.pickupTime,
  'dropoffTime': instance.dropoffTime,
  'status': instance.status,
  'tmp_crew_name': instance.crewName,
};
