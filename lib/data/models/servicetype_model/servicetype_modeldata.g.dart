// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicetype_modeldata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTypeModelData _$ServiceTypeModelDataFromJson(
  Map<String, dynamic> json,
) => ServiceTypeModelData(
  dataset: (json['dataset'] as List<dynamic>?)
      ?.map((e) => ServiceTypeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ServiceTypeModelDataToJson(
  ServiceTypeModelData instance,
) => <String, dynamic>{'dataset': instance.dataset};
