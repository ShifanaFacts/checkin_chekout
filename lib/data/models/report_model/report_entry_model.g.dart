// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportEntryModel _$ReportEntryModelFromJson(Map<String, dynamic> json) =>
    ReportEntryModel(
      type: json['type'] as String?,
      createdby: json['createdby'] as String?,
      createdts: json['createdts'] == null
          ? null
          : DateTime.parse(json['createdts'] as String),
      remarks: json['remarks'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ReportEntryModelToJson(ReportEntryModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'createdby': instance.createdby,
      'createdts': instance.createdts?.toIso8601String(),
      'remarks': instance.remarks,
      'attachments': instance.attachments,
    };
