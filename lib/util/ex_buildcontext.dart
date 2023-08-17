import 'package:flutter/material.dart';

extension ExBuildContext on BuildContext{
  Future goName(Widget page){
    return Navigator.push(this, MaterialPageRoute(builder: (c){
      return page;
    }));
  }
}