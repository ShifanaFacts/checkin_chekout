// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amenities_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmenitiesModelData _$AmenitiesModelDataFromJson(Map<String, dynamic> json) =>
    AmenitiesModelData(
      dataset: (json['dataset'] as List<dynamic>?)
          ?.map((e) => AmenitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AmenitiesModelDataToJson(AmenitiesModelData instance) =>
    <String, dynamic>{'dataset': instance.dataset};
