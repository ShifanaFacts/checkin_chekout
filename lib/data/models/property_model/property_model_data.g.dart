// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModelData _$PropertyModelDataFromJson(Map<String, dynamic> json) =>
    PropertyModelData(
      dataset: (json['dataset'] as List<dynamic>?)
          ?.map((e) => PropertyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropertyModelDataToJson(PropertyModelData instance) =>
    <String, dynamic>{'dataset': instance.dataset};
