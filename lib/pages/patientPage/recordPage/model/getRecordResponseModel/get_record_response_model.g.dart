// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_record_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecordResponseModel _$GetRecordResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetRecordResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GetRecordResponseModelToJson(
        GetRecordResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
