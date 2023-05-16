// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_reminder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReminderResponseModel _$AddReminderResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddReminderResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$AddReminderResponseModelToJson(
        AddReminderResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
