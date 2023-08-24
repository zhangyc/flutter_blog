import 'dart:io';

import 'package:dio/dio.dart';

import '../../../util/dio_util.dart';


class UserApis{
  // 登录接口，登录成功后返回用户信息
 static Future<HttpResult> login(String email, String pwd) async {
    return get(
      "/users/login",
      queryParameters: {
        'username':email,
        'password':pwd,
      },
    );
  }
  //注册
 static Future<HttpResult> register(String email, String pwd,String code) async {
    return post(
      "/register",
      data: {

        'username':email,
        'password':pwd,
        'code':code
      },
    );
  }
 //注册
 static Future<HttpResult> signUpAndSignIn(String email, String pwd,String code) async {
   return post(
     "/register",
     data: {

       'username':email,
       'password':pwd,
       'code':code
     },
   );
 }
 // 更新用户头像
 static Future<HttpResult> updateUserAvatar(File  file) async {
   return uploadAvatarImage(file);
 }
  // 发送验证码接口
 static Future<HttpResult> sendCode({Map<String,dynamic>? q}) async {
    return get(
        '/users/code',
        queryParameters: q
    );
  }
}