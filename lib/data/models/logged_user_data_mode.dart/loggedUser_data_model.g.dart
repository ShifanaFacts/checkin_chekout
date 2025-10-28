// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loggedUser_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedUserModel _$LoggedUserModelFromJson(Map<String, dynamic> json) =>
    LoggedUserModel(
      Emp_Name: json['Emp_Name'] as String?,
      Designation: json['Designation'] as String?,
      Department: json['Department'] as String?,
      Division: json['Division'] as String?,
      Employe_id: json['Employe_id'] as String?,
    );

Map<String, dynamic> _$LoggedUserModelToJson(LoggedUserModel instance) =>
    <String, dynamic>{
      'Emp_Name': instance.Emp_Name,
      'Designation': instance.Designation,
      'Department': instance.Department,
      'Division': instance.Division,
      'Employe_id': instance.Employe_id,
    };
