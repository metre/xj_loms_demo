import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/constants.dart';
import 'package:xj_loms_manager/common/utils/http_util.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/model/apply_model.dart';
import 'package:xj_loms_manager/model/task_detail_model.dart';
import 'package:xj_loms_manager/model/task_model.dart';


typedef void  Callback(List<ApplyModel> data);

class ApplyListNet {
  Callback callBack;


  void post(BuildContext context, int id,Callback callBack) {

    this.callBack = callBack;
    String url = Constants.URL_APPLY_LIST;


    //Map<String,String> params =  {"\"lastId\"":"$id","\"limit\"":"20"};

    Map<String,String> params =  {"lastId":"$id","limit":"20"};

    HttpUtil.post(url: url, params:params,callBack: _callback);
  }

  void _callback(res) {

    PrintUtil.println(res);
    if(this.callBack != null){
      this.callBack(ApplyModel.fromListJson(res['data']));
    }
  }
}
