import 'package:flutter/material.dart';
import 'package:xj_loms_manager/net/my_task_net.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/common/utils/util.dart';
import 'package:xj_loms_manager/model/task_model.dart';

class MyTaskForType extends StatefulWidget {
  final int type;

  const MyTaskForType({this.type});

  @override
  State<StatefulWidget> createState() => MyTaskForTypeState();
}

class MyTaskForTypeState extends State<MyTaskForType> {
  List<TaskModel> _list = [];

  ScrollController _controller = ScrollController();

  int _lastId;

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
    MyTaskNet().get(context, widget.type, 10, _lastId, (data) {
      setState(() {
        _list.addAll(data);
        if(_list.length>0) {
          _lastId = _list[_list.length - 1].id;
        }
        isLoadingMore = false;
      });
    });
  }

  Future<Null> _onRefresh() async {
    MyTaskNet().get(context, widget.type, 10, null, (data) {
      setState(() {
        _list = data;
        if(_list.length>0) {
          _lastId = _list[_list.length - 1].id;
        }
        return null;
      });
    });
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
    TaskModel bean = _list[index];

    Column listView = Column(children: <Widget>[
      Row(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 4, bottom: 10),
            child: Util.getImage('icon_my_task_station_patrol.png', 20, 20)),
        Text(bean.type, style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("站点编号：${bean.site}",
                    style: TextStyle(color: Colors.grey)))),
        Align(
            alignment: Alignment.centerRight,
            child: getIconByState(bean.status))
      ]),
      Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("期望完成时间：${bean.time}",
                  style: TextStyle(fontWeight: FontWeight.bold)))),
      Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.only(left: 10, top: 16, bottom: 10),
              child: Text("任务内容：${bean.content}",
                  style: TextStyle(color: Colors.grey)))),
      Divider(
        color: Colors.grey,
        height: 1,
        indent: 0,
      )
    ]);

    return InkWell(child: listView, onTap: () {
      Routes.startTaskDetailPage(context, bean.id);
    });
  }

  Widget getIconByState(String state) {
    String url = "";
    if (state == '0') {
      url = 'icon_my_task_to_deal.png';
    } else if (state == '1') {
      url = 'icon_my_task_finished.png';
    }
    return Util.getImage(url, 50, 20);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
