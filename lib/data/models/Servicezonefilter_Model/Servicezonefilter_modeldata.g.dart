// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Servicezonefilter_modeldata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceZoneFilterModelData _$ServiceZoneFilterModelDataFromJson(
  Map<String, dynamic> json,
) => ServiceZoneFilterModelData(
  dataset: (json['dataset'] as List<dynamic>?)
      ?.map((e) => ServiceZoneFilterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ServiceZoneFilterModelDataToJson(
  ServiceZoneFilterModelData instance,
) => <String, dynamic>{'dataset': instance.dataset};
