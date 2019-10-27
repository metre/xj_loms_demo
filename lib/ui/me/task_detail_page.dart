import 'package:flutter/material.dart';
import 'package:xj_loms_manager/net/task_detail_net.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/common/utils/util.dart';
import 'package:xj_loms_manager/common/widgets/static_rating_bar.dart';
import 'package:xj_loms_manager/model/task_detail_model.dart';

class TaskDetailPage extends StatefulWidget {
  final int id;
  final String title;

  const TaskDetailPage({this.id,this.title = "任务详情"});

  @override
  State<StatefulWidget> createState() {
    return TaskDetailState();
  }
}

class TaskDetailState extends State<TaskDetailPage> {
  TaskDetailModel model;

  TaskDetailNet net;

  @override
  void initState() {
    super.initState();

    PrintUtil.println("TaskDetail | id:${widget.id}");


    net = TaskDetailNet();
    net.get(context, widget.id, (task) {
      setState(() {
        model = task;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ListView listView = ListView(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(top: 20,bottom: 10),
          child: Row(
              crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child:
              Column(children: <Widget>[
                Center(child: Text("待处理",style: TextStyle(color: model?.taskItemStatus == 0 || model?.taskItemStatus == 1?Colors.deepOrange:Colors.grey))),
                Padding(padding:EdgeInsets.only(top:10,bottom: 20),child: Center(child: Text(model?.createTime == null?"":model?.createTime,style: TextStyle(color:Colors.grey)))),
              ]),
              flex: 1),
              Expanded(child:Align(alignment: Alignment.center,child: Text("已完成",style: TextStyle(color: model?.taskItemStatus == 1?Colors.deepOrange:Colors.grey))), flex: 1),
            ],
          )),
      Container(
        color: Colors.black12,
        child: Padding(padding:EdgeInsets.only(top: 12,bottom: 12,left: 10),child:Text("任务详情",style: TextStyle(color:Colors.grey))),
      ),
      
      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Row(children: <Widget>[
        Align(child: Util.getImage('icon_my_task_station_patrol.png', 20, 20)),
        Padding(padding: EdgeInsets.only(right: 40,left: 20),child: Text(model?.taskTypeName == null?"":model?.taskTypeName,style: TextStyle(color: Colors.black))),

        Text("站点编号：${model?.siteNo}",style: TextStyle(color: Colors.grey))
      ])),

      Padding(padding: EdgeInsets.only(left: 10,top: 10,bottom: 20),
          child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
          Text("期望完成时间：${model?.expectFinishedTime}",style: TextStyle(color: Colors.black)),
          Padding(padding: EdgeInsets.only(top: 10,bottom: 10),child: Text("配送物料：${model?.sendMateriel}",style: TextStyle(color: Colors.grey))),
          Text("任务内容：${model?.taskContent}",style: TextStyle(color: Colors.grey)),
      ])),

      Container(
        color: Colors.black12,
        child: Padding(padding:EdgeInsets.only(top: 12,bottom: 12,left: 10),child:Text("巡查员评分",style: TextStyle(color:Colors.grey))),
      ),

      Padding(padding: EdgeInsets.only(left: 10,top: 30,bottom: 20),
          child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Text("总分：",style: TextStyle(color: Colors.black)),
                Padding(padding: EdgeInsets.only(top: 30,bottom: 10),child: Text("内容：",style: TextStyle(color: Colors.black))),
              ])),
      Container(
        color: Colors.black12,
        child: Padding(padding:EdgeInsets.only(top: 12,bottom: 12,left: 10),child:Text("站主评分",style: TextStyle(color:Colors.grey))),
      ),




      Padding(
          padding: EdgeInsets.only(top: 20,bottom: 10,right: 10,left: 10),
          child: Row(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              new StaticRatingBar(
                size: 20.0,
                rate: 4,
              ),
              Padding(padding: EdgeInsets.only(left: 10,top: 3),child: Text("4分")),
              Expanded(child:Align(alignment: Alignment.centerRight,child: Text("满分5.0分",style: TextStyle(color: Colors.grey))), flex: 1),
            ],
          )),
          
          Padding(padding: EdgeInsets.only(left: 10,bottom: 30,top: 10),child: Text("评价内容：")),

      Container(
        color: Colors.black12,
        child: Padding(padding: EdgeInsets.only(bottom: 30,top: 20),
            child:RaisedButton(textColor:Colors.white,color:Colors.blue,
                child:Padding(padding: EdgeInsets.only(top: 18,bottom: 18),child: Text("立即处理")),onPressed: (){})),
      ),


    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Routes.goBack(context);
            }),
      ),
      body: listView,
    );
  }
}
