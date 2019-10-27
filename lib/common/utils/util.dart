import 'package:flutter/material.dart';

class Util {


  static bool isEmpty(String str){
    return str == null || "" == str || "null" == str;
  }

  /*
   * 根据image路径获取图片
   */
  static Image getTabImageByAssets(path) {
    return new Image.asset('assets/$path', width: 24.0, height: 24.0);
  }

  /*
   * 根据image路径获取图片
   */
  static Image getTabImageByImages(path) {
    return new Image.asset('assets/$path', width: 24.0, height: 24.0);
  }

  /*
   * 根据image路径获取图片
   */
  static Image getImage(path,double width,double height) {
    return new Image.asset('assets/$path', width: width, height: height);
  }

  /*
   * 根据image路径获取图片
   */
  static Image getImageAsset(path) {
    return new Image.asset('assets/$path');
  }


}
