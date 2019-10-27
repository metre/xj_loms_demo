import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/constants.dart';
import 'package:xj_loms_manager/common/utils/http_util.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/model/approval_model.dart';
import 'package:xj_loms_manager/model/task_model.dart';


typedef void  Callback(List<ApprovalModel> data);

class MyApprovalNet {
  Callback callBack;
  void post(BuildContext context, String listType, int limit,int lastId,Callback callBack) {
    this.callBack = callBack;

    //finish/wait

    Map<String, String> params = {'lastId':"$lastId",'listType':"$listType", 'limit': "$limit"};

    HttpUtil.post(
        url: Constants.URL_MY_APPROVAL, params: params, callBack: _callback);
  }

  void _callback(res) {

    PrintUtil.println(res);
    if(this.callBack != null){
      this.callBack(ApprovalModel.fromListJson(res['data']));
    }
  }
}
