import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/constants.dart';
import 'package:xj_loms_manager/common/utils/http_util.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/model/task_detail_model.dart';
import 'package:xj_loms_manager/model/task_model.dart';


typedef void  Callback(TaskDetailModel data);

class TaskDetailNet {
  Callback callBack;
  void get(BuildContext context, int id,Callback callBack) {

    this.callBack = callBack;
    String url = "${Constants.URL_MY_TASK_DETAIL}/$id";

    HttpUtil.get(url: url, callBack: _callback);
  }

  void _callback(res) {

    PrintUtil.println(res);
    if(this.callBack != null){
      this.callBack(TaskDetailModel.fromJson(res['data']));
    }
  }
}
