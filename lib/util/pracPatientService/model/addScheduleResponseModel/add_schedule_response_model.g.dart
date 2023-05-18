// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_schedule_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddScheduleResponseModel _$AddScheduleResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddScheduleResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$AddScheduleResponseModelToJson(
        AddScheduleResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
