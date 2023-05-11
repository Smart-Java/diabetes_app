// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordResponseModel _$ForgotPasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponseModel(
      status: json['status'] as bool? ?? false,
      data: json['data'] as List<dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordResponseModelToJson(
        ForgotPasswordResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
