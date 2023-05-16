// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reminders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReminderResponseModel _$GetReminderResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetReminderResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GetReminderResponseModelToJson(
        GetReminderResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
