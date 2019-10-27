import 'package:flutter/material.dart';
import 'package:xj_loms_manager/model/apply_detail_model.dart';
import 'package:xj_loms_manager/net/apply_detail_net.dart';
import 'package:xj_loms_manager/net/task_detail_net.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/common/utils/util.dart';
import 'package:xj_loms_manager/common/widgets/static_rating_bar.dart';
import 'package:xj_loms_manager/model/task_detail_model.dart';

class ApplyDetailPage extends StatefulWidget {
  final String bizId;
  final int flowId;
  final int id;
  final String title;

  const ApplyDetailPage({this.bizId,this.id,this.flowId,this.title = "标题"});

  @override
  State<StatefulWidget> createState() {
    return ApplyDetailState();
  }
}

class ApplyDetailState extends State<ApplyDetailPage> {
  ApplyDetailModel model = ApplyDetailModel();
  ApplyDetailNet net;

  List<FinishList> _finishis = [];

  @override
  void initState() {
    super.initState();

    PrintUtil.println("ApplyDetailState | bizId:${widget.bizId}");


    net = ApplyDetailNet();
    net.post(context,widget.bizId,widget.id,widget.flowId,(task) {
      setState(() {
        model = task;

        if(model != null && model.json != null && model.json.finishList != null)
          _finishis = model.json.finishList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {


    List<TableRow> _tableRows = [];
    _tableRows.add(TableRow(
        children: [
          SizedBox(height:40,child: Center(child: Text("时间",style: TextStyle(color: Colors.black)))),
          SizedBox(height:40,child: Center(child: Text("操作者",style: TextStyle(color: Colors.black)))),
          SizedBox(height:40,child: Center(child: Text("操作",style: TextStyle(color: Colors.black)))),
          SizedBox(height:40,child: Center(child: Text("处理意见",style: TextStyle(color: Colors.black))))
        ]));

    _tableRows.addAll(_finishis.map(
            (t){
          return TableRow(
              children: [
                SizedBox(height:40,child: Center(child: Text("${t.createDate}",style: TextStyle(color: Colors.grey)))),
                SizedBox(height:40,child: Center(child: Text("${t.acceptByName}",style: TextStyle(color: Colors.grey)))),
                SizedBox(height:40,child: Center(child: Text("${t.nodeName}",style: TextStyle(color: Colors.grey)))),
                SizedBox(height:40,child: Center(child: Text("${t.content == null?"":t.content}",style: TextStyle(color: Colors.grey))))
              ]);


        }).toList());


    ListView listView = ListView(children: <Widget>[
      Container(
        color: Colors.black12,
        child: Padding(padding:EdgeInsets.only(top: 12,bottom: 12,left: 10),child:Text("基本信息",style: TextStyle(color:Colors.grey))),
      ),

      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10,left: 10),child: Text("站点编号：",style: TextStyle(color: Colors.black))),
        Text("${model?.bizObject?.stationCode}",style: TextStyle(color: Colors.grey))
      ])),

      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10,left: 10),child: Text("申请时间：",style: TextStyle(color: Colors.black))),
        Text("${model?.bizObject?.createDate}",style: TextStyle(color: Colors.grey))
      ])),

      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10,left: 10),child: Text("申请类型：",style: TextStyle(color: Colors.black))),
        Text("${model?.bizObject?.type?.text}",style: TextStyle(color: Colors.grey))
      ])),

      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10,left: 10),child: Text("停/开机原因：",style: TextStyle(color: Colors.black))),
    Padding(padding: EdgeInsets.only(right: 30,left: 10,top: 10),child:  Text("${model?.bizObject?.reason}",style: TextStyle(color: Colors.grey)))
      ])),

      Container(
        color: Colors.black12,
        child: Padding(padding:EdgeInsets.only(top: 12,bottom: 12,left: 10),child:Text("站点信息",style: TextStyle(color:Colors.grey))),
      ),

      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10,left: 10),child: Text("站点编号：",style: TextStyle(color: Colors.black))),
        Text("${model?.bizObject?.stationCode}",style: TextStyle(color: Colors.grey))
      ])),

      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10,left: 10),child: Text("负责人名称：",style: TextStyle(color: Colors.black))),
        Text("${model?.bizObject?.createByName}",style: TextStyle(color: Colors.grey))
      ])),

      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10,left: 10),child: Text("移动电话：",style: TextStyle(color: Colors.black))),
        Text("${model?.bizObject?.mobile}",style: TextStyle(color: Colors.grey))
      ])),

      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10,left: 10),child: Text("身份证号码：",style: TextStyle(color: Colors.black))),
        Text("${model?.bizObject?.idCard}",style: TextStyle(color: Colors.grey))
      ])),

      Padding(padding:EdgeInsets.only(left: 10,top: 20,bottom: 10),child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 10,left: 10),child: Text("投注站地址：",style: TextStyle(color: Colors.black))),
        Text("${model?.bizObject?.address}",style: TextStyle(color: Colors.grey))
      ])),

      Container(
        color: Colors.black12,
        child: Padding(padding:EdgeInsets.only(top: 12,bottom: 12,left: 10),child:Text("处理意见",style: TextStyle(color:Colors.grey))),
      ),


      Table(
        columnWidths: const{
          0:FixedColumnWidth(110),1:FixedColumnWidth(70),2:FixedColumnWidth(70),3:FixedColumnWidth(40)},
        border: TableBorder.all(color: Colors.grey,width: 1,style: BorderStyle.solid),
          children:_tableRows, )

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
