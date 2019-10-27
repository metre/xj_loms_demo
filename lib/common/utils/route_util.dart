import 'package:flutter/material.dart';
import 'package:xj_loms_manager/main.dart';
import 'package:xj_loms_manager/ui/home/login_page.dart';
import 'package:xj_loms_manager/ui/me/my_task_page.dart';
import 'package:xj_loms_manager/ui/me/task_detail_page.dart';
import 'package:xj_loms_manager/ui/work/apply_detail_page.dart';
import 'package:xj_loms_manager/ui/work/apply_page.dart';
import 'package:xj_loms_manager/ui/work/my_apply_page.dart';
import 'package:xj_loms_manager/ui/work/my_approval_page.dart';

class Routes {
  static final String nameLogin = "/router/login";
  static final String nameMain = "/router/main";
  static final String nameMyTask = "/router/mytask";
 // static final String nameTaskDetail = "/router/taskDetail";
  static final String nameApply = "/router/applyPage";
  static final String nameMyApply = "/router/myApplyPage";
  static final String nameApproval = "/router/Approval";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      nameLogin: (_) => LoginPage(),
      nameMain: (_) => LaunchPage(),
      nameMyTask: (_) => MyTaskPage(),
      nameApply: (_) => ApplyPage(),
      nameMyApply: (_) => MyApplyPage(),
      nameApproval: (_) => MyApprovalPage(),


    };
  }

  static void startPage(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  static void goBack(BuildContext context){
    Navigator.pop(context);
  }

  static void startTaskDetailPage(BuildContext context,int id){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return TaskDetailPage(id:id);
    }));
  }

  static void startTaskDetailPage2(BuildContext context,String id,String name){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return TaskDetailPage(id:int.parse(id),title: name);
    }));
  }

  static void startApplyDetailPage(BuildContext context,String bizId,int id,int flowId,String name){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return ApplyDetailPage(bizId:bizId,id:id,flowId: flowId,title: name);
    }));
  }
}
