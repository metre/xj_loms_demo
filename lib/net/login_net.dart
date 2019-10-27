
import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/constants.dart';
import 'package:xj_loms_manager/common/utils/http_util.dart';
import 'package:xj_loms_manager/common/utils/md5_util.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/common/utils/shared_preference_util.dart';

typedef void CallBack(dynamic res);
class LoginNet{

  CallBack callBack;

  void login(BuildContext context,String userName,String pwd,CallBack cb){
    callBack = cb;
      /*Future<String> imeiFuture = DeviceId.getIMEI;
      imeiFuture.then((imei){
      });*/

    pwd = Md5Util.generateMd5(pwd);

/*   Map<String,Object> params = {
      "\"mobile\"":"\"$userName\"",
      "\"pwd\"":"\"$pwd\"",
      "\"id\"":"\"77fb6a532185ef9fe0583c56ca5f8f44\"",
      "\"terminal\"":"\"0\"",
      "\"imei\"":"\"990008690705608\""
    };*/

    Map<String,String> params = {
      "mobile":"$userName",
      "pwd":"$pwd",
      "id":"77fb6a532185ef9fe0583c56ca5f8f44",
      "terminal":"0",
      "imei":"990008690705608"
    };

    _post(params);

  }

  void _post(params){

    HttpUtil.post(url: Constants.URL_LOGIN,params: params,callBack: _callback);
  }

  void _callback(dynamic res){

    PrintUtil.println(res);
    String code = res['code'];
    if(code == "0"){
      dynamic data = res['data'];
      SharedPrefsUtil.putString(Constants.SHARED_KEY_USER_TOKEN, data['token'].toString());
      SharedPrefsUtil.putString(Constants.SHARED_KEY_USEE_INFO, data.toString());
    }

    if(callBack!=null)
      callBack(res);
  }
}