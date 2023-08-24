import 'dart:convert';

import 'package:blog/mobile/main/beans/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_quill/flutter_quill.dart' as q;

class BlogDetail extends StatefulWidget {
  const BlogDetail({super.key, required this.article});
  final Article article;
  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  late q.QuillController _controller;
  @override
  void initState() {
    if(widget.article.contentFormat==2){
      _controller = q.QuillController(
        document: q.Document.fromJson(jsonDecode(widget.article.articleContent!)),
        selection: TextSelection.collapsed(offset: 0),

      );
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.articleTitle??''),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    if(widget.article.contentFormat==1){
      return Markdown(data: widget.article.articleContent??'');
    }else if(widget.article.contentFormat==2){
      return Container(
        color: Colors.white10,
        padding: const EdgeInsets.all(8.0),
        child: q.QuillEditor.basic(
          autoFocus: false,
          controller: _controller,
          readOnly: true,
        ),
      );
    }
  }
}
