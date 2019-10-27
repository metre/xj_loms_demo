import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/net/my_approvel_net.dart';
import 'package:xj_loms_manager/common/utils/util.dart';
import 'package:xj_loms_manager/model/approval_model.dart';

class MyApprovalForType extends StatefulWidget {
  final String type;

  const MyApprovalForType({this.type});

  @override
  State<StatefulWidget> createState() => MyApprovalForTypeState();
}

class MyApprovalForTypeState extends State<MyApprovalForType> {
  List<ApprovalModel> _list = [];

  ScrollController _controller = ScrollController();

  int _lastId = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
    _onRefresh();
  }

  bool isLoadingMore = false;

  _loadMoreData() async {
    if (isLoadingMore) return;
    setState(() {
      isLoadingMore = true;

    });

    _post();

  }

  void _post(){
    MyApprovalNet().post(context, widget.type, 20, _lastId, (data) {
      setState(() {
        if(isLoadingMore) {
          _list.addAll(data);
        }else{
          _list = data;
        }
        if(_list.length>0) {
          //_lastId = _list[_list.length - 1].bizId;
        }
        isLoadingMore = false;
      });
    });
  }

  Future<Null> _onRefresh() async {
    _lastId = 0;
    _post();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if(index == _list.length){
                  return _buildLoadText();
                }else {
                  return _itemView(context, index);
                }
              },
              controller: _controller,
              itemCount: _list.length + 1),
          onRefresh: _onRefresh),
    );
  }

  Widget _buildLoadText() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Opacity(
          opacity: isLoadingMore ? 1.0 : 0.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _itemView(BuildContext context, int index) {
    ApprovalModel bean = _list[index];

    Column listView = Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[

          Align(alignment: Alignment.centerRight,child: getStateByType(bean.status)),
          Row(
              crossAxisAlignment:CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left:10,right: 10),child: getIconByState(bean.flowCode),),
                Text(bean.flowName,style: TextStyle(color: Colors.black)),

              ]),

          Padding(padding: EdgeInsets.all(10),child:
          Text("申请人：${bean.createByName}",style: TextStyle(color: Colors.black))),

          Padding(padding: EdgeInsets.only(left: 10,bottom: 10),child:
          Text(bean.createDate,style: TextStyle(color: Colors.grey))),

          Divider(
            color: Colors.grey,
            height: 1,
            indent: 0,
          )

        ]);

    return InkWell(child: listView, onTap: () {
      Routes.startApplyDetailPage(context, bean.bizId,bean.instanceId,bean.flowId,bean.flowName);
    });
  }


  Widget getIconByState(String state) {
    String url = "";
    if (state == 'station_recover_cert_xinjiang') {
      url = 'icon_flow_list_clear_flag.png';
    } else if (state == 'station_openclose') {
      url = 'icon_flow_list_apply_open.png';
    } else{
      url = 'icon_flow_list_loss_report.png';
    }
    return Util.getImage(url, 20, 20);
  }



  Widget getStateByType(String type) {
    String url = "";
    if (type == 'wait') {
      url = 'icon_flow_status_untreated.png';
    } else if (type == 'finish') {
      url = 'icon_my_task_finished.png';
    }else{
      url = "icon_flow_status_untreated.png";
    }
    return Util.getImage(url, 50, 20);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
