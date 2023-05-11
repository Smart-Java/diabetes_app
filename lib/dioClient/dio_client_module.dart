import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:diabetes_care/api/apiEndpoints/api_end_points.dart';
import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/interceptors/authentication_interceptor.dart';
import 'package:diabetes_care/interceptors/network_interceptor.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioClientModule {
  @lazySingleton
  Dio get dioClient => Dio(
        BaseOptions(
          baseUrl: APIEndPoints.baseURL,
        ),
      )..interceptors.addAll(
          [getIt<NetworkInterceptor>(), getIt<AuthenticationInterceptor>()]);

  @injectable
  Connectivity get connectivity => Connectivity();
}
