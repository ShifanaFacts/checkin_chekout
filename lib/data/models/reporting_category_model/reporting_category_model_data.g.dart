// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporting_category_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportingCategoryModelData _$ReportingCategoryModelDataFromJson(
  Map<String, dynamic> json,
) => ReportingCategoryModelData(
  dataset: (json['dataset'] as List<dynamic>?)
      ?.map((e) => ReportingCategorymodel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReportingCategoryModelDataToJson(
  ReportingCategoryModelData instance,
) => <String, dynamic>{'dataset': instance.dataset};
