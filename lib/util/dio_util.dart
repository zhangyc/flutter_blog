import 'dart:io';

import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    connectTimeout: Duration(seconds: 10),
    baseUrl: 'http://192.168.31.49:8081/',
  ),
);
Future<HttpResult> get(String path,{Map<String, dynamic>? queryParameters,}){
  return dio.get(path,queryParameters: queryParameters).then((value) => HttpResult(value));
}
Future<HttpResult> post(String path,{Map<String, dynamic>? queryParameters, dynamic data}){
  return dio.post(path,queryParameters: queryParameters,data: data,options: Options(
    headers: {
      "Content-Type":Headers.jsonContentType
    }
  )).then((value) => HttpResult(value));
}
Future<HttpResult> uploadAvatarImage(File file) async {
  String fileName = file.path.split('/').last;
  FormData formData = FormData.fromMap({
    "file":
    await MultipartFile.fromFile(file.path, filename:fileName),
  });
  final response = await dio.post("/users/avatar", data: formData);
  return HttpResult(response);
}
class HttpResult{
  dynamic data;
  int code=0;
  bool get isSuccess => code==20000;
  HttpResult(Response response){
    code=response.data['code'];
    data=response.data['data'];
  }
}