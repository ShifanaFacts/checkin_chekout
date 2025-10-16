// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_schedule_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverScheduleModelData _$DriverScheduleModelDataFromJson(
  Map<String, dynamic> json,
) => DriverScheduleModelData(
  dataset: (json['dataset'] as List<dynamic>?)
      ?.map((e) => DriverScheduleModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DriverScheduleModelDataToJson(
  DriverScheduleModelData instance,
) => <String, dynamic>{'dataset': instance.dataset};
