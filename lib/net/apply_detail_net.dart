import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/constants.dart';
import 'package:xj_loms_manager/common/utils/http_util.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/common/utils/toast_util.dart';
import 'package:xj_loms_manager/model/apply_detail_model.dart';
import 'package:xj_loms_manager/model/apply_model.dart';
import 'package:xj_loms_manager/model/task_detail_model.dart';
import 'package:xj_loms_manager/model/task_model.dart';


typedef void  Callback(ApplyDetailModel data);

class ApplyDetailNet {
  Callback callBack;
  BuildContext context;


  void post(BuildContext context,String bizId,int id,int flowId,Callback callBack) {
    this.context = context;
    this.callBack = callBack;
    String url = Constants.URL_FLOW_DEAL;

    //Map<String,String> params =  {"waitId":"1991","instanceId":"1991","bizId":"116","flowId":"44"};
    //Map<String,String> params =  {"waitId":"1991","instanceId":"1991","bizId":"116","flowId":"44"};
    Map<String,String> params =  {"waitId":"$id","instanceId":"$id","bizId":"$bizId","flowId":"$flowId"};
    HttpUtil.post(url: url, params:params,callBack: _callback);

  }

  void _callback(res) {

    PrintUtil.println(res);

    String code = res['code'];
    String msg = res['msg'];

    PrintUtil.println("code--->$code");
    PrintUtil.println("msg--->$msg");

    if(code != '0'){
      ToastUtil.show(this.context, msg);
    }

    if(this.callBack != null){
      dynamic data = res['data'];
      //this.callBack(ApplyDetailModel.fromJson(data['bizObject']));
      this.callBack(ApplyDetailModel.fromJson(data));
    }
  }
}
