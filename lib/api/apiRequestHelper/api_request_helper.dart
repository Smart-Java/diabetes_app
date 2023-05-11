import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiRequestHelper {
  Dio dio;
  Connectivity connectivity;
  ApiRequestHelper(this.connectivity, this.dio);

  Future postRequest(String endPoint,
      {Map<String, dynamic>? jsonData,
      bool isDataRequired = false,
      Map<String, dynamic>? headers}) async {
    dynamic postRequestResponse;
    Options options = Options(headers: headers);
    try {
      if (isDataRequired == true) {
        postRequestResponse = await dio.post(endPoint,
            data: jsonEncode(jsonData), options: options);
      } else {
        postRequestResponse = await dio.post(endPoint, options: options);
      }
    } on DioError catch (e) {
      debugPrint('this is the error ${e.response}');
      if (e.error != null) {
        debugPrint('this is the error ${e.toString()}');
        var status = e.response!.statusCode;
        var data = e.response!.data;
        debugPrint(e.response!.statusCode.toString());
        debugPrint(data.toString());
        postRequestResponse = {'statusCode': status, 'data': data};
      } else {
        var status = e.response!.statusCode;
        var data = e.response!.data;
        debugPrint(e.response!.statusCode.toString());
        debugPrint(data.toString());
        postRequestResponse = {'statusCode': status, 'data': data};
      }
    }
    return postRequestResponse;
  }

  Future postRequestWithFormData(String endPoint,
      {required FormData formData, Map<String, dynamic>? headers}) async {
    dynamic postRequestWithFormDataResponse;
    Options options = Options(headers: headers);
    try {
      postRequestWithFormDataResponse =
          await dio.post(endPoint, data: formData, options: options);
    } on DioError catch (e) {
      if (e.error != null) {
        debugPrint(e.toString());
        var status = e.response!.statusCode;
        var data = e.response!.data;
        debugPrint(e.response!.statusCode.toString());
        debugPrint(data.toString());
        postRequestWithFormDataResponse = {'statusCode': status, 'data': data};
      } else {
        var status = e.response!.statusCode;
        var data = e.response!.data;
        debugPrint(e.response!.statusCode.toString());
        debugPrint(data.toString());
        postRequestWithFormDataResponse = {'statusCode': status, 'data': data};
      }
    }
    return postRequestWithFormDataResponse;
  }

  Future deleteRequest(String endPoint,
      {Map<String, String?>? jsonData,
      bool isDataRequired = false,
      Map<String, dynamic>? headers}) async {
    dynamic deleteRequestResponse;
    Options options = Options(headers: headers);
    try {
      if (isDataRequired == true) {
        deleteRequestResponse = await dio.post(endPoint,
            data: jsonEncode(jsonData), options: options);
      } else {
        deleteRequestResponse = await dio.post(endPoint, options: options);
      }
    } on DioError catch (e) {
      if (e.error != null) {
        debugPrint(e.toString());
        var status = e.response!.statusCode;
        var data = e.response!.data;
        debugPrint(e.response!.statusCode.toString());
        debugPrint(data.toString());
        deleteRequestResponse = {'statusCode': status, 'data': data};
      } else {
        var status = e.response!.statusCode;
        var data = e.response!.data;
        debugPrint(e.response!.statusCode.toString());
        debugPrint(data.toString());
        deleteRequestResponse = {'statusCode': status, 'data': data};
      }
    }
    return deleteRequestResponse;
  }

  Future getRequest(String endPoint, {Map<String, dynamic>? headers}) async {
    dynamic getRequestResponse;
    Options options = Options(headers: headers);
    try {
      getRequestResponse = await dio.get(endPoint, options: options);
    } on DioError catch (e) {
      if (e.error != null) {
        debugPrint(e.toString());
        var status = e.response!.statusCode;
        var data = e.response!.data;
        debugPrint(e.response!.statusCode.toString());
        debugPrint(data.toString());
        getRequestResponse = {'statusCode': status, 'data': data};
      } else {
        var status = e.response!.statusCode;
        var data = e.response!.data;
        debugPrint(e.response!.statusCode.toString());
        debugPrint(data.toString());
        getRequestResponse = {'statusCode': status, 'data': data};
      }
    }
    return getRequestResponse;
  }
}
