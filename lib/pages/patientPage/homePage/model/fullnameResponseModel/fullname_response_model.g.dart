// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullname_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullnameResponseModel _$FullnameResponseModelFromJson(
        Map<String, dynamic> json) =>
    FullnameResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FullnameResponseModelToJson(
        FullnameResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
