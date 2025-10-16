// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amineties_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AminetiesModelData _$AminetiesModelDataFromJson(Map<String, dynamic> json) =>
    AminetiesModelData(
      dataset: (json['dataset'] as List<dynamic>?)
          ?.map((e) => AminetiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AminetiesModelDataToJson(AminetiesModelData instance) =>
    <String, dynamic>{'dataset': instance.dataset};
