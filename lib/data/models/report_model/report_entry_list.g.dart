// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_entry_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportEntryModelList _$ReportEntryModelListFromJson(
  Map<String, dynamic> json,
) => ReportEntryModelList(
  dataset: (json['dataset'] as List<dynamic>?)
      ?.map((e) => ReportEntryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReportEntryModelListToJson(
  ReportEntryModelList instance,
) => <String, dynamic>{'dataset': instance.dataset};
