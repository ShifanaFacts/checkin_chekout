// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicetask_checklist_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTaskCheckListModelData _$ServiceTaskCheckListModelDataFromJson(
  Map<String, dynamic> json,
) => ServiceTaskCheckListModelData(
  dataset: (json['dataset'] as List<dynamic>)
      .map((e) => ServiceTaskCheckListModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ServiceTaskCheckListModelDataToJson(
  ServiceTaskCheckListModelData instance,
) => <String, dynamic>{'dataset': instance.dataset};
