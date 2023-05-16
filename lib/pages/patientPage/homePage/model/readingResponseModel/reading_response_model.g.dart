// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingResponseModel _$ReadingResponseModelFromJson(
        Map<String, dynamic> json) =>
    ReadingResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ReadingResponseModelToJson(
        ReadingResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
