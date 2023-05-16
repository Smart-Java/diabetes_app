// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_record_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRecordResponseModel _$UpdateRecordResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateRecordResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$UpdateRecordResponseModelToJson(
        UpdateRecordResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
