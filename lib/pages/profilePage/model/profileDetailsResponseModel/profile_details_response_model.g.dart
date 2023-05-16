// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetailsResponseModel _$ProfileDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileDetailsResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ProfileDetailsResponseModelToJson(
        ProfileDetailsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
