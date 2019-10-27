
import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/common/utils/toast_util.dart';
import 'package:xj_loms_manager/common/widgets/icon_text.dart';
import 'package:xj_loms_manager/common/widgets/work_card.dart';

class ApplyPage extends StatelessWidget{

  BuildContext context;


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("发起申请"),
        centerTitle: true,
        leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Routes.goBack(context);
            }),
      ),
      body: Container(
        color: Colors.white30,
        child: Column(children: <Widget>[
          WorkCard(
              widget: Row(children: <Widget>[
                IconText(icon: "icon_initiat_apply.png", text: "站点清标申请",onClick: _onClick,id: 1),
                IconText(icon: "icon_my_apply.png", text: "损耗申请",onClick: _onClick,id: 2),
                IconText(icon: "icon_my_approve.png", text: "站点停开机",onClick: _onClick,id: 3),
              ]))

        ],),
      ),
    );
  }



  void _onClick(IconText view){
    ToastUtil.show(context,"View Id: ${view.id}",);


    switch(view.id){
      case 1:
        break;
    }
  }

}