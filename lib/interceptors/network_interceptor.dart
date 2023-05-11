import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkInterceptor extends Interceptor {
  NetworkInterceptor(
    this._connection,
  );
  final Connection _connection;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final isInternetEnabled = await _connection.isInternetEnabled();
      if (isInternetEnabled) return handler.next(options);
      handler
          .reject(DioError(requestOptions: options, type: DioErrorType.cancel));
    } catch (ex) {
      // throw GeneralException(ex.toString());
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(err.message);
    return handler.reject(err);
  }
}
