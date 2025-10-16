// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicetask_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTaskModelData _$ServiceTaskModelDataFromJson(
  Map<String, dynamic> json,
) => ServiceTaskModelData(
  dataset: (json['dataset'] as List<dynamic>)
      .map((e) => ServiceTaskModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ServiceTaskModelDataToJson(
  ServiceTaskModelData instance,
) => <String, dynamic>{'dataset': instance.dataset};
