// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicecall_item_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceCallItemModelData _$ServiceCallItemModelDataFromJson(
  Map<String, dynamic> json,
) => ServiceCallItemModelData(
  dataset: (json['dataset'] as List<dynamic>?)
      ?.map((e) => ServiceCallItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ServiceCallItemModelDataToJson(
  ServiceCallItemModelData instance,
) => <String, dynamic>{'dataset': instance.dataset};
