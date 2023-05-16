// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_diet_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDietResponseModel _$AddDietResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddDietResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$AddDietResponseModelToJson(
        AddDietResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
