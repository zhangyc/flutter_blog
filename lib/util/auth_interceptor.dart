import 'dart:io';

import 'package:dio/dio.dart';

import '../app_constants.dart';

class AuthInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Token'] = 'Bearer $userToken';
    super.onRequest(options, handler);
  }
}