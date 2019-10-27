import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';


class Md5Util {


  // md5加密
  static String generateMd5(String str) {
    var content = new Utf8Encoder().convert(str);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }


}