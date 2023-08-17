import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CreationBlog extends StatefulWidget {
  const CreationBlog({super.key});
  static const routeName='creation_blog';

  @override
  State<CreationBlog> createState() => _CreationBlogState();
}

class _CreationBlogState extends State<CreationBlog> {
  late QuillController _controller;
  @override
  void initState() {
    _controller = QuillController.basic();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.maybeOf(context)!.padding.top,
          ),
          QuillToolbar.basic(controller: _controller),
          Expanded(
            child: QuillEditor.basic(
              autoFocus: false,
              controller: _controller,
              readOnly: false, // true for view only mode
            ),
          ),
        ],
      ),
    );
  }
}
