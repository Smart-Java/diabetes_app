// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientsResponseModel _$PatientsResponseModelFromJson(
        Map<String, dynamic> json) =>
    PatientsResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PatientsResponseModelToJson(
        PatientsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
