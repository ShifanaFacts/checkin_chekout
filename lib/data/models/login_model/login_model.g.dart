// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
  id: json['Id'] as String?,
  un: json['un'] as String?,
  access_token: json['access_token'] as String?,
  expiration: json['expiration'] as String?,
);

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'un': instance.un,
      'access_token': instance.access_token,
      'expiration': instance.expiration,
    };
