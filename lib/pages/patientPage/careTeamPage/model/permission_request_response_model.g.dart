// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionRequestResponseModel _$PermissionRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    PermissionRequestResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$PermissionRequestResponseModelToJson(
        PermissionRequestResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
