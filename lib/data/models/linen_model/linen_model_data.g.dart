// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linen_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinenModelData _$LinenModelDataFromJson(Map<String, dynamic> json) =>
    LinenModelData(
      dataset: (json['dataset'] as List<dynamic>?)
          ?.map((e) => LinenModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LinenModelDataToJson(LinenModelData instance) =>
    <String, dynamic>{'dataset': instance.dataset};
