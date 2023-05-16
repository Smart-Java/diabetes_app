// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_access_code_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccessCodeResponseModel _$NewAccessCodeResponseModelFromJson(
        Map<String, dynamic> json) =>
    NewAccessCodeResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NewAccessCodeResponseModelToJson(
        NewAccessCodeResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
