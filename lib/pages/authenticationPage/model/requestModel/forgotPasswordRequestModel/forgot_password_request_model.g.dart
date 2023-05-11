// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordRequestModel _$ForgotPasswordRequestModelFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordRequestModel(
      emailAddress: json['emailAddress'] as String,
      confirmPassword: json['confirmPassword'] as String,
      password: json['password'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$ForgotPasswordRequestModelToJson(
        ForgotPasswordRequestModel instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'token': instance.token,
    };
