import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:xj_loms_manager/common/constants.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/common/utils/shared_preference_util.dart';
import 'package:xj_loms_manager/common/utils/util.dart';


typedef HttpCallback = void Function(dynamic res);

class HttpUtil{



  static get({@required String url,Map<String,Object> params,HttpCallback callBack}) async {

    if(params != null && params.length >= 1){

      url += "?";
      //Iterable<String> keys = params.keys;
      //PrintUtil.println("keys ==> $keys");
      params.forEach((key,value){
        Object value = params[key];
        if(value != null)
          url += "$key=$value&";
      });

    }
    PrintUtil.println("Http get url:$url");


    Map<String,String> headers =  await _headers();

    http.Response response = await http.get(url,headers: headers);
    if(response == null){
      PrintUtil.println("Http get response was null!");
      return;
    }
    PrintUtil.println("StatusCode:${response.statusCode}");
    PrintUtil.println("response.body:${response.body}");

    callBack(json.decode(response.body));
  }

  ///json作为参数时，body必须为String类型。
  static post({@required String url,Map<String,String> params,HttpCallback callBack}) async {

    PrintUtil.println("Http post url :$url");


    Map<String,String> body = {};

    params?.forEach((key,value){
      if(!Util.isEmpty(key) && !Util.isEmpty(value)){
        body.putIfAbsent("\"$key\"", (){
          return "\"$value\"";
        });
      }
    });


    PrintUtil.println("Http post body:$body");


    Map<String,String> headers =  await _headers();
    http.Response response = await http.post(url,body: body.toString(),headers:headers);
    if(response == null){
      PrintUtil.println("Http post response was null!");
      return;
    }
    PrintUtil.println("StatusCode:${response.statusCode}");
    PrintUtil.println("response.body:${response.body}");

    callBack(json.decode(response.body));
    //callBack(response.body);
  }

  static Future<Map<String,String>> _headers() async{


    //"Content-Type":"application/json",
    //"token":"Sw2oYPRowMRKNtStnPaezlSyCA6iiHTiXlC5Mxy8J-zcOD7U-m_ObfFreXzuxL12VsGwW21ZxI03y9Kv5Yn1RULw5yWezQPU1KiJnOBI7sxLNQEu6i66WWfRUNeuHOtoIJjmqKjr_6tp-tp3WUL0igNpkl2AvKdwIjLtSLJtuCs"


    String token = await SharedPrefsUtil.getString(Constants.SHARED_KEY_USER_TOKEN);

    //token = "f9dkGWhSqsgl4sqlGSSMgB_DLsUTVKAtBSbbH42qGR1DrCEi4E_gN8KgGKv-FTDEvBeVAFK9-LSzrsVbYU2ZSWAvdkbVHSYWxxqwZ0OgkVMPzU0g9kOJMwXg4M7pyMbN1BkOAAbtwrGkvC0UkTutWRP8N16WJxuJ-2Gsux4BPFc";

    Map<String, String> headers = {
      "Content-Type":"application/json",
      "token":token
    };

    headers.forEach((k,v){
      PrintUtil.println("headers [$k-$v]");
    });

    return headers;
  }


}