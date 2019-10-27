
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ToastUtil{
  static void show(BuildContext context,String msg){
    Toast.show(msg,context,gravity:Toast.CENTER,duration: Toast.LENGTH_SHORT);
  }
}