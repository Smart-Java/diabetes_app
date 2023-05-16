// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_diet_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDietResponseModel _$GetDietResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetDietResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GetDietResponseModelToJson(
        GetDietResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
