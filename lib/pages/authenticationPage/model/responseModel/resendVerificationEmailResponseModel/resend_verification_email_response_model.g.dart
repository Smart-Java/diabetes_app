// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_verification_email_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendVerificationEmailResponseModel
    _$ResendVerificationEmailResponseModelFromJson(Map<String, dynamic> json) =>
        ResendVerificationEmailResponseModel(
          message: json['message'] as String?,
          data: json['data'] as Map<String, dynamic>?,
          status: json['status'] as bool? ?? false,
        );

Map<String, dynamic> _$ResendVerificationEmailResponseModelToJson(
        ResendVerificationEmailResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
