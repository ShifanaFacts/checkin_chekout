// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      roleid: json['roleid'] as String?,
      name: json['name'] as String?,
      usertype: json['usertype'] as String?,
    )..DID = json['DID'] as String?;

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'roleid': instance.roleid,
      'name': instance.name,
      'usertype': instance.usertype,
      'DID': instance.DID,
    };
