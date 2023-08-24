
import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:blog/util/dio_util.dart';
import 'package:dio/dio.dart' ;
import 'package:http_parser/http_parser.dart';

import '../../main/beans/article.dart';

class CreationApi{
  static Future<String> uploadFile(File file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path,
          filename: '${DateTime.now().millisecondsSinceEpoch}${p.extension(file.path)}',
          contentType: MediaType('image','${file.path.split(".").last}')
      )
    });
   return post('/admin/articles/images',data: formData).then
     ((value) {
      if(value.isSuccess){
        return value.data;
      }else {
        return '';
      }
   });

  }
  static Future<HttpResult> save(Map article){
    return post('/admin/articles',data: article);
  }
}