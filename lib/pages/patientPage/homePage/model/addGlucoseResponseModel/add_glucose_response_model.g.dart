// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_glucose_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddGlucoseResponseModel _$AddGlucoseResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddGlucoseResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$AddGlucoseResponseModelToJson(
        AddGlucoseResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
