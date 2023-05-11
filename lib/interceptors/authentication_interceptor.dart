import 'package:dio/dio.dart';
import 'package:diabetes_care/api/apiEndpoints/api_end_points.dart';
import 'package:diabetes_care/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
// import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticationInterceptor extends Interceptor {
  final AppSharedPreferences appSharedPreferences;
  final AppFlutterSecureStorage appFlutterSecureStorage;
  AuthenticationInterceptor(this.appSharedPreferences, this.appFlutterSecureStorage,);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers[APIEndPointsParameter.authHeader] != null) {
      var token = await appFlutterSecureStorage.readLoginToken();
      options.headers[APIEndPointsParameter.authHeader] =
          APIEndPointsParameter.bearer + token;
    }
    return handler.next(options);
  }
}
