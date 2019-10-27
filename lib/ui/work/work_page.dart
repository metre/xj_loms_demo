import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/common/widgets/icon_text.dart';
import 'package:xj_loms_manager/common/widgets/work_card.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class WorkPage extends StatelessWidget {

  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(color: Colors.white70,
        child:
    Column(
      children: <Widget>[
        WorkCard(
            widget: Row(children: <Widget>[
              IconText(icon: "icon_initiat_apply.png", text: "发起申请",onClick: _onClick,id: 1),
              IconText(icon: "icon_my_apply.png", text: "我的申请",onClick: _onClick,id: 2),
              IconText(icon: "icon_my_approve.png", text: "我的审批",onClick: _onClick,id: 3),
            ])),
        WorkCard(
            widget: Column(children: <Widget>[
              Row(children: <Widget>[
                IconText(icon: "icon_charge_of_station.png", text: "负责站点",onClick: _onClick,id: 4),
                IconText(icon: "icon_sale_rank.png", text: "销量排行",onClick: _onClick,id: 5),
                IconText(icon: "icon_sale_query.png", text: "销量查询",onClick: _onClick,id: 6),
                IconText(icon: "icon_percent_conversion.png", text: "转化率查询",onClick: _onClick,id: 7)
              ]),
              Row(children: <Widget>[
                IconText(icon: "icon_task_count.png", text: "任务统计",onClick: _onClick),
                IconText(icon: "icon_draw_notice.png", text: "开奖公告",onClick: _onClick),
                Expanded(child: Text(""), flex: 1),
                Expanded(child: Text(""), flex: 1)
              ])
            ])),
        WorkCard(
            widget: Row(children: <Widget>[
              IconText(icon: "icon_store_manager.png", text: "仓库管理",onClick: _onClick),
              IconText(icon: "icon_account_statement.png", text: "台账报表",onClick: _onClick),
              IconText(icon: "icon_maintain_knowledge.png", text: "维修知识库",onClick: _onClick),
              Expanded(child: Text(""), flex: 1)
            ])),
        WorkCard(
            widget: Row(children: <Widget>[
              IconText(icon: "icon_train_online.png", text: "在线培训",onClick: _onClick),
              IconText(icon: "icon_exam_online.png", text: "在线考试",onClick: _onClick),
              IconText(icon: "icon_train_outline.png", text: "线下培训",onClick: _onClick),
              Expanded(child: Text(""), flex: 1),
            ])),
      ],
    )
    );
  }


  void _onClick(IconText view){
    switch(view.id){
      case 1:
        Routes.startPage(context, Routes.nameApply);
        break;
      case 2:
        Routes.startPage(context, Routes.nameMyApply);
        break;
      case 3:
        Routes.startPage(context, Routes.nameApproval);
        break;
      case 4:
        Routes.startPage(context, Routes.nameLogin);
        break;
      default:
        Toast.show("View Id: ${view.id}",context, duration:Toast.LENGTH_SHORT, gravity:Toast.CENTER);
      }
  }
}



