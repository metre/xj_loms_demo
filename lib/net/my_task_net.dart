import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/constants.dart';
import 'package:xj_loms_manager/common/utils/http_util.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/model/task_model.dart';


typedef void  Callback(List<TaskModel> data);

class MyTaskNet {
  Callback callBack;
  void get(BuildContext context, int type, int limit,int lastId,Callback callBack) {
    this.callBack = callBack;

    Map<String, Object> params = {'lastId':lastId,'status':type, 'limit': limit};

    HttpUtil.get(
        url: Constants.URL_MY_TASK, params: params, callBack: _callback);
  }

  void _callback(res) {

    PrintUtil.println(res);
    if(this.callBack != null){
      this.callBack(TaskModel.fromListJson(res['data']));
    }
  }
}
