// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckinVieModel _$CheckinVieModelFromJson(Map<String, dynamic> json) =>
    CheckinVieModel(
      PJCTALLOC: json['PJCTALLOC'] as String?,
      EMPCOST: json['EMPCOST'] as String?,
      ACTALLOC: json['ACTALLOC'] as String?,
      JOBMST_DESC: json['JOBMST_DESC'] as String?,
      Dept: json['Dept'] as String?,
      checkintime: json['checkintime'] as String?,
      checkouttime: json['checkouttime'] as String?,
      partytype: json['partytype'] as String?,
    );

Map<String, dynamic> _$CheckinVieModelToJson(CheckinVieModel instance) =>
    <String, dynamic>{
      'PJCTALLOC': instance.PJCTALLOC,
      'EMPCOST': instance.EMPCOST,
      'ACTALLOC': instance.ACTALLOC,
      'JOBMST_DESC': instance.JOBMST_DESC,
      'Dept': instance.Dept,
      'checkintime': instance.checkintime,
      'checkouttime': instance.checkouttime,
      'partytype': instance.partytype,
    };
