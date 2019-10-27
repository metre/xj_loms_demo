import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/ui/me/my_task_all_page.dart';

class MyTaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyTaskState();
}

class MyTaskState extends State<MyTaskPage>
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
          title: Text("我的任务"),
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Routes.goBack(context);
            },
          )),
      body: TabBarView(children: <Widget>[
        MyTaskForType(type:null),//全部
        MyTaskForType(type:0),//待处理
        MyTaskForType(type:1), //已完成


      ], controller: _tabController),
    );
  }
}
