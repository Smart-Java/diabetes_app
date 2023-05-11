// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_for_forgot_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailForForgotPasswordResponseModel
    _$SendEmailForForgotPasswordResponseModelFromJson(
            Map<String, dynamic> json) =>
        SendEmailForForgotPasswordResponseModel(
          status: json['status'] as bool? ?? false,
          data: json['data'] as List<dynamic>?,
          message: json['message'] as String?,
        );

Map<String, dynamic> _$SendEmailForForgotPasswordResponseModelToJson(
        SendEmailForForgotPasswordResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
