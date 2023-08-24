import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:blog/mobile/creation/apis/creation_api.dart';
import 'package:blog/mobile/main/beans/article.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:image_picker/image_picker.dart';

import '../../app_constants.dart';
import '../main/beans/category.dart';
import '../main/beans/tag.dart';

class CreationBlog extends StatefulWidget {
  const CreationBlog({super.key});
  static const routeName='creation_blog';

  @override
  State<CreationBlog> createState() => _CreationBlogState();
}

class _CreationBlogState extends State<CreationBlog> {
  late quill.QuillController _controller;
  PageController pageController=PageController();
  TextEditingController _articleTitle=TextEditingController();
  @override
  void initState() {
    _controller = quill.QuillController.basic();
    try{
      List listTags=jsonDecode(tags);
      _tags=listTags.map((e) => Tag.fromJson(e)).toList();
      List listC=jsonDecode(categories);
      _categories=listC.map((e) => Category.fromJson(e)).toList();
    }catch (e){

    }


    super.initState();
  }
  List<Category> _categories=[];
  List<Tag> _tags=[];

  int currentPage=0;
  Category? category;
  Tag? tag;
  FocusNode _focusNode1=FocusNode();
  FocusNode _focusNode2=FocusNode();
  String cover='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (pageIndex){
          currentPage=pageIndex;
          setState(() {

          });
        },
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.maybeOf(context)!.padding.top,
              ),
              TextField(autofocus: false,
                focusNode: _focusNode1,// true for view only mode
                controller: _articleTitle,
               decoration: InputDecoration(
                 hintText: '请输入文章标题',
                 contentPadding: EdgeInsets.symmetric(
                   horizontal: 8
                 )
               ),
              ),
              SizedBox(
                height: 4,
              ),
              quill.QuillToolbar.basic(controller: _controller),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: quill.QuillEditor.basic(
                    autoFocus: false,
                    controller: _controller,
                    readOnly: false,
                    focusNode: _focusNode2,// true for view only mode
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('文章分类'),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: _categories.map((e) => GestureDetector(child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: e.selected?Colors.deepPurple:Colors.grey,
                      child: Text('${e.categoryName}')),
                    onTap: (){
                      e.selected=!e.selected;
                      category=e;
                      setState(() {

                      });
                    },
                  )).toList(),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('文章标签'),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: _tags.map((e) => GestureDetector(child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: e.selected?Colors.deepPurple:Colors.grey,
                      child: Text('${e.tagName}')),
                      onTap: (){
                         e.selected=!e.selected;
                         tag=e;
                         setState(() {

                         });
                      },
                  )).toList(),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('文章封面'),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.add),
                    decoration: cover.isEmpty?null:BoxDecoration(
                        // color: Colors.amber,
                        image: DecorationImage(image: FileImage(File(cover)))
                    ),
                  ),
                  onTap: (){
                    final ImagePicker _picker = ImagePicker();
                    _picker.pickImage(source: ImageSource.gallery).then((value){
                      if(value!=null){
                        CreationApi.uploadFile(File(value.path)).then((rep){
                          cover=value.path;
                          setState(() {

                          });
                        });
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text('置顶'),
                    Switch.adaptive(value: true, onChanged: (value){

                    }),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text('发布状态'),
                    Switch.adaptive(value: true, onChanged: (value){

                    }),
                  ],
                ),
                ElevatedButton(onPressed: (){
                  if(category==null){
                    return;
                  }
                  if(tag==null||cover.isEmpty){
                    return;
                  }
                  if(_controller.document.toPlainText().isEmpty){
                    return;
                  }

                  _ArticleVo article=_ArticleVo();
                  article.categoryName=category!.categoryName;
                  article.articleContent=jsonEncode(_controller.document.toDelta().toJson());
                  article.articleTitle=_articleTitle.text;
                  article.articleCover=cover;
                  article.tagNameList=_tags.where((element) => element.selected==true).map((e) => '${e.tagName}').toList();
                  article.isTop=0;
                  article.contentFormat=2;
                  article.status=1;
                  CreationApi.save(article.toJson()).then((value){
                    if(value.isSuccess){
                       Navigator.pop(context);
                    }
                  });

                 }, child: Text('发布'))
              ],
            ),
          )

        ],
      ),
      floatingActionButton: currentPage==1?Container():FloatingActionButton.small(onPressed: (){
        ///点击设置文章种类和标签，以及设置文章的封面。
        pageController.jumpToPage(currentPage+1);
       },child: Icon(Icons.save),),
    );
  }
}
class _ArticleVo {
  int? id;
  String? articleTitle;
  String? articleContent;
  String? articleCover;
  String? categoryName;
  List<String>? tagNameList;
  int? type;
  String? originalUrl;
  int? isTop;
  int? status;
  int? contentFormat;  ///1md 2quill
  _ArticleVo(
      {this.id,
        this.articleTitle,
        this.articleContent,
        this.articleCover,
        this.categoryName,
        this.tagNameList,
        this.type,
        this.originalUrl,
        this.isTop,
        this.status,
        this.contentFormat,

      });

  _ArticleVo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleTitle = json['articleTitle'];
    articleContent = json['articleContent'];
    articleCover = json['articleCover'];
    categoryName = json['categoryName'];
    tagNameList = json['tagNameList'].cast<String>();
    type = json['type'];
    originalUrl = json['originalUrl'];
    isTop = json['isTop'];
    status = json['status'];
    contentFormat = json['contentFormat'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleTitle'] = this.articleTitle;
    data['articleContent'] = this.articleContent;
    data['articleCover'] = this.articleCover;
    data['categoryName'] = this.categoryName;
    data['tagNameList'] = this.tagNameList;
    data['type'] = this.type;
    data['originalUrl'] = this.originalUrl;
    data['isTop'] = this.isTop;
    data['status'] = this.status;
    data['contentFormat'] = this.contentFormat;

    return data;
  }
}
