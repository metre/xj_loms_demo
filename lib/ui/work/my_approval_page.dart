import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/ui/me/my_task_all_page.dart';
import 'package:xj_loms_manager/ui/work/my_approval_type_page.dart';

///我的审批
class MyApprovalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyTaskState();
}

class MyTaskState extends State<MyApprovalPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottom: TabBar(controller: _tabController, tabs: <Widget>[
            Tab(icon: Text("全部")),
            Tab(icon: Text("待处理")),
            Tab(icon: Text("已完成")),
          ]),
          centerTitle: true,
          title: Text("我的审批"),
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Routes.goBack(context);
            },
          )),
      body: TabBarView(children: <Widget>[
        MyApprovalForType(type:null),//全部
        MyApprovalForType(type:"wait"),//待处理
        MyApprovalForType(type:"finish"), //已完成


      ], controller: _tabController),
    );
  }
}
