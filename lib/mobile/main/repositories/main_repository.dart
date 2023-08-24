import 'dart:convert';

import 'package:blog/app_constants.dart';
import 'package:blog/mobile/base/base_repository.dart';
import 'package:blog/util/dio_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../beans/article.dart';

class MainRepository extends BaseRepository with ChangeNotifier{
  List<Article> _articles=[];

  List<Article> get articles => _articles;

  set articles(List<Article> value) {
    _articles = value;
    notifyListeners();
  }
  Future<List<Article>> getLocalData(){
    List list=jsonDecode(blogs);
    return Future.value(articles=list.map((e) => Article.fromJson(e)).toList());
  }
  Future<List<Article>> getRemoteData(){
    return get('/articles').then((value){
      if(value.isSuccess){
        List list=value.data;
        blogs=jsonEncode(list);
        return articles=list.map((e) => Article.fromJson(e)).toList();
      }else {
        return [];
      }
    });
  }

  @override
  void query() {
    Stream.fromFutures([getLocalData(),getRemoteData()]);
    super.query();
  }

}