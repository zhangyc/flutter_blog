import 'dart:convert';
import 'dart:developer';

import 'package:blog/util/dio_util.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app_constants.dart';
import '../beans/article.dart';

class HomeProvider with ChangeNotifier{

   delete(String id){

   }
   initDate(){
      get('/articles',queryParameters: {
        'current':current
      }).then((value){
         if(value.isSuccess){
           refreshController.refreshCompleted();
           List list=value.data;
           articles=list.map((e) => Article.fromJson(e)).toList();
         }
      });
      get("/tags").then((value){
        if(value.isSuccess){
          tags=jsonEncode(value.data['recordList']);
        }
      });
      get('/categories').then((value){
        if(value.isSuccess){
          categories=jsonEncode(value.data['recordList']);
        }
      });
   }
   List<Article> _articles=[];

   List<Article> get articles => _articles;

  set articles(List<Article> value) {
    _articles = value;
    notifyListeners();
  }
  int current=1;
  loadMore(){
    current=current+1;
    get('/articles',queryParameters: {
    'current':current
    }).then((value){
      if(value.isSuccess){
        List list=value.data;
        articles.addAll(list.map((e) => Article.fromJson(e)).toList());
        refreshController.loadComplete();
        notifyListeners();
      }
    });
  }
  RefreshController refreshController = RefreshController(initialRefresh: false);
}