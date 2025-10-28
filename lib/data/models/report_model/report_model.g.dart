// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDataModel _$ReportDataModelFromJson(Map<String, dynamic> json) =>
    ReportDataModel(
      checkInTime: json['checkInTime'] as String?,
      checkOutTime: json['checkOutTime'] as String?,
      project: json['project'] as String?,
      department: json['department'] as String?,
      activity: json['activity'] as String?,
      employeename: json['employeename'] as String?,
      desig_desc: json['desig_desc'] as String?,
      TotalHours: (json['TotalHours'] as num?)?.toDouble(),
      effectivedate: json['effectivedate'] as String?,
    );

Map<String, dynamic> _$ReportDataModelToJson(ReportDataModel instance) =>
    <String, dynamic>{
      'employeename': instance.employeename,
      'desig_desc': instance.desig_desc,
      'project': instance.project,
      'department': instance.department,
      'activity': instance.activity,
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
      'TotalHours': instance.TotalHours,
      'effectivedate': instance.effectivedate,
    };
