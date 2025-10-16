// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
  id: json['Id'] as String?,
  un: json['un'] as String?,
  token: json['token'] as String?,
  expiration: json['expiration'] as String?,
);

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'un': instance.un,
      'token': instance.token,
      'expiration': instance.expiration,
    };
