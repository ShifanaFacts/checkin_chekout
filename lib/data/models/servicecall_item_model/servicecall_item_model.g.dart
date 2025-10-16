// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicecall_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceCallItemModel _$ServiceCallItemModelFromJson(
  Map<String, dynamic> json,
) => ServiceCallItemModel(
  servicedoctype: json['servicedoctype'] as String?,
  serviceNumber: json['serviceNumber'] as String?,
  serviceDateTime: json['serviceDateTime'] == null
      ? null
      : DateTime.parse(json['serviceDateTime'] as String),
  property: json['property'] as String?,
  status: json['status'] as String?,
  servicetypes: json['servicetypes'] as String?,
  amenitiesdetails: json['amenitiesdetails'] as String?,
  linendetails: json['linendetails'] as String?,
  crewName: json['crewName'] as String?,
  scheduleddatetime: json['scheduleddatetime'] == null
      ? null
      : DateTime.parse(json['scheduleddatetime'] as String),
  servicetypeslist: (json['servicetypeslist'] as List<dynamic>?)
      ?.map((e) => ServiceTypeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  aminetieslist: (json['aminetieslist'] as List<dynamic>?)
      ?.map((e) => AmenitiesModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  linenlist: (json['linenlist'] as List<dynamic>?)
      ?.map((e) => LinenModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  reportlist: (json['reportlist'] as List<dynamic>?)
      ?.map((e) => Reportingmodel.fromJson(e as Map<String, dynamic>))
      .toList(),
  propertyobject: json['propertyobject'] == null
      ? null
      : PropertyModel.fromJson(json['propertyobject'] as Map<String, dynamic>),
  trackingStatus: json['trackingStatus'] as String?,
  taskStartedTime: json['taskStartedTime'] as String?,
  taskEndedTime: json['taskEndedTime'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ServiceCallItemModelToJson(
  ServiceCallItemModel instance,
) => <String, dynamic>{
  'servicedoctype': instance.servicedoctype,
  'serviceNumber': instance.serviceNumber,
  'serviceDateTime': instance.serviceDateTime?.toIso8601String(),
  'property': instance.property,
  'status': instance.status,
  'servicetypes': instance.servicetypes,
  'amenitiesdetails': instance.amenitiesdetails,
  'linendetails': instance.linendetails,
  'crewName': instance.crewName,
  'scheduleddatetime': instance.scheduleddatetime?.toIso8601String(),
  'servicetypeslist': instance.servicetypeslist,
  'aminetieslist': instance.aminetieslist,
  'linenlist': instance.linenlist,
  'reportlist': instance.reportlist,
  'propertyobject': instance.propertyobject,
  'trackingStatus': instance.trackingStatus,
  'taskStartedTime': instance.taskStartedTime,
  'taskEndedTime': instance.taskEndedTime,
  'rating': instance.rating,
};
