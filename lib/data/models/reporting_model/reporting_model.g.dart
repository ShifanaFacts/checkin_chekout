// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reportingmodel _$ReportingmodelFromJson(Map<String, dynamic> json) =>
    Reportingmodel(
      id: json['id'] as String?,
      reporting_value: json['reporting_value'] as String?,
      reporting_fields: json['reporting_fields'] as String?,
    );

Map<String, dynamic> _$ReportingmodelToJson(Reportingmodel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporting_value': instance.reporting_value,
      'reporting_fields': instance.reporting_fields,
    };
