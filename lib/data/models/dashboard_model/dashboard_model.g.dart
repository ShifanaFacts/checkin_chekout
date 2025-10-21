// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      jsonResult: (json['jsonResult'] as List<dynamic>?)
          ?.map((e) => DashboardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{'jsonResult': instance.jsonResult};

DashboardItem _$DashboardItemFromJson(Map<String, dynamic> json) =>
    DashboardItem(
      key: json['Key'] as String?,
      description: json['Description'] as String?,
      loadOnClick: (json['LoadOnClick'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DashboardItemToJson(DashboardItem instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'Description': instance.description,
      'LoadOnClick': instance.loadOnClick,
    };
