// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietRequestResponseModel _$DietRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    DietRequestResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$DietRequestResponseModelToJson(
        DietRequestResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
