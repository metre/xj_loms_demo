import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/common/utils/util.dart';

typedef void OnItemClick();

class MePage extends StatelessWidget {


  Widget getItem(String image,String name,OnItemClick onClick){

    return InkWell(child: Row(children: <Widget>[
      Padding(
          padding: EdgeInsets.all(14),
          child: Util.getImage(image, 24, 24)),
      Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),)
    ]),onTap: (){
      onClick();
    },);


  }


  @override
  Widget build(BuildContext context) {

    Column menuList = Column(
      children: <Widget>[

       /* getItem('icon_my_appraisal.png','我的考核',(){
          Toast.show("我的考核",context);
        }),*/

        Divider(height: 1),

        getItem('icon_my_task.png','我的任务',(){
          //Toast.show("我的任务",context);
          Routes.startPage(context, Routes.nameMyTask);
        }),

        Divider(height: 1),

        getItem('icon_my_scan.png','扫一扫',(){
          Toast.show("扫一扫",context);
        }),

        Divider(height: 1,color: Colors.grey),

        getItem('icon_me_setting.png','设置',(){
          Toast.show("设置",context);
        }),

        Divider(height: 1),

      ],
    );

    Container headView = Container(
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(alignment: Alignment.topRight, children: <Widget>[
            Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 10),
                  child: Util.getImage('icon_head.png', 80, 80)),
            ),
            InkWell(child: Padding(
                padding: EdgeInsets.only(top: 30,right: 20),
                child: Util.getImage('icon_notice.png',26, 26)),onTap: (){}),
          ]),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text("巡查员",
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          Text("19235011552",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 14, right: 10, bottom: 20),
                child: Text("任务",
                    style: TextStyle(color: Colors.white, fontSize: 16))),
            Padding(
                padding: EdgeInsets.only(top: 14, left: 10, bottom: 20),
                child: Text("绩效",
                    style: TextStyle(color: Colors.white, fontSize: 16))),
          ])
        ],
      ),
    );

    return Container(
      color: Colors.white70,
      child: ListView(
        children: <Widget>[headView, menuList],
      ),
    );
  }
}
