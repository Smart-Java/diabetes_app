// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCategoryResponseModel _$UserCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserCategoryResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserCategoryResponseModelToJson(
        UserCategoryResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
