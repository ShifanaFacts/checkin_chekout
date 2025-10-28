// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_time_modelList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportTimeDataModelList _$ReportTimeDataModelListFromJson(
  Map<String, dynamic> json,
) => ReportTimeDataModelList(
  TotalTime: json['TotalTime'] as String?,
  reportModel: (json['reportModel'] as List<dynamic>?)
      ?.map((e) => ReportDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReportTimeDataModelListToJson(
  ReportTimeDataModelList instance,
) => <String, dynamic>{
  'TotalTime': instance.TotalTime,
  'reportModel': instance.reportModel,
};
