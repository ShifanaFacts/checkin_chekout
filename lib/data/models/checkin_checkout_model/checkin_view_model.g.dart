// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckinVieModel _$CheckinVieModelFromJson(Map<String, dynamic> json) =>
    CheckinVieModel(
      checkintime: json['checkintime'] as String?,
      JOBMST_DOCNO: json['JOBMST_DOCNO'] as String?,
      JOBMST_DESC: json['JOBMST_DESC'] as String?,
      ACT_DOCNO: json['ACT_DOCNO'] as String?,
      DEPT_DESC: json['DEPT_DESC'] as String?,
      checkouttime: json['checkouttime'] as String?,
      partytype: json['partytype'] as String?,
    )..COST_DESC = json['COST_DESC'] as String?;

Map<String, dynamic> _$CheckinVieModelToJson(CheckinVieModel instance) =>
    <String, dynamic>{
      'JOBMST_DOCNO': instance.JOBMST_DOCNO,
      'JOBMST_DESC': instance.JOBMST_DESC,
      'COST_DESC': instance.COST_DESC,
      'ACT_DOCNO': instance.ACT_DOCNO,
      'DEPT_DESC': instance.DEPT_DESC,
      'checkintime': instance.checkintime,
      'checkouttime': instance.checkouttime,
      'partytype': instance.partytype,
    };
