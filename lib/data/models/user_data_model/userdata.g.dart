// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  dataset: (json['dataset'] as List<dynamic>?)
      ?.map((e) => UserDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'dataset': instance.dataset,
};
