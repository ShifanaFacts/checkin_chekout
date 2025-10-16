// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicetask_checklist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTaskCheckListModel _$ServiceTaskCheckListModelFromJson(
  Map<String, dynamic> json,
) => ServiceTaskCheckListModel(
  id: json['docno'] as String?,
  taskCheckItems: json['docdesc'] as String?,
  istaskChecked: (json['istaskChecked'] as num?)?.toInt(),
);

Map<String, dynamic> _$ServiceTaskCheckListModelToJson(
  ServiceTaskCheckListModel instance,
) => <String, dynamic>{
  'docno': instance.id,
  'docdesc': instance.taskCheckItems,
  'istaskChecked': instance.istaskChecked,
};
