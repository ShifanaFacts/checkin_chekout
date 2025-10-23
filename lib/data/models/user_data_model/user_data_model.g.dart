// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      userdesig: json['userdesig'] as String?,
      userdept: json['userdept'] as String?,
      employeeId: json['employeeId'] as String?,
      department: json['department'] as String?,
      username: json['username'] as String?,
      DID: json['DID'] as String?,
      profileImage: json['profileImage'] as String?,
      status: json['status'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'userdesig': instance.userdesig,
      'userdept': instance.userdept,
      'employeeId': instance.employeeId,
      'department': instance.department,
      'username': instance.username,
      'DID': instance.DID,
      'profileImage': instance.profileImage,
      'status': instance.status,
      'description': instance.description,
    };
