// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporting_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportingModelData _$ReportingModelDataFromJson(Map<String, dynamic> json) =>
    ReportingModelData(
      dataset: (json['dataset'] as List<dynamic>?)
          ?.map((e) => Reportingmodel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportingModelDataToJson(ReportingModelData instance) =>
    <String, dynamic>{'dataset': instance.dataset};
