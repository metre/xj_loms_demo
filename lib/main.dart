import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/common/utils/util.dart';
import 'package:xj_loms_manager/ui/home/home_page.dart';
import 'package:xj_loms_manager/ui/me/me_page.dart';
import 'package:xj_loms_manager/ui/work/work_page.dart';

void main() => runApp(MyApp());

//App Bar 标题
String appBarTitle = "";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LaunchPage(title: appBarTitle),
       routes: Routes.getRoutes(),
    );
  }


}

class LaunchPage extends StatefulWidget {
  LaunchPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LaunchPageState createState() => _LaunchPageState();
}





class _LaunchPageState extends State<LaunchPage>  with SingleTickerProviderStateMixin{

  //当前页
  int _currentPageIndex = 0;
  //Tab控制器
  TabController _tabController;

  //Page集合
  List<Widget> _pages;

  //底部栏按钮
  List<BottomModel> _tabs;


  var _tabIcons;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new BottomModel(name: "首页", index: 0),
      new BottomModel(name: "工作", index: 1),
      new BottomModel(name: "我的", index: 2)
    ];

    _tabController = new TabController(length: _tabs.length, vsync: this);

    _pages = [
      HomePage(),
      /*Container(
          alignment: Alignment.center,
          child: Text("首页",
              style: new TextStyle(color: Colors.deepPurple, fontSize: 30))),*/
      WorkPage(),
      /*Container(
          alignment: Alignment.center,
          child: Text("工作",
              style: new TextStyle(color: Colors.deepPurple, fontSize: 30))),*/
      MePage()
      /*Container(
          alignment: Alignment.center,
          child: Text("我的",
              style: new TextStyle(color: Colors.deepPurple, fontSize: 30)))*/
    ];

    _tabIcons = [
      [
        Util.getTabImageByAssets('main_head_uncheck.png'),
        Util.getTabImageByAssets('main_head_check.png'),
      ],
      [
        Util.getTabImageByAssets('main_work_uncheck.png'),
        Util.getTabImageByAssets('main_work_check.png'),
      ],
      [
        Util.getTabImageByAssets('main_mine_uncheck.png'),
        Util.getTabImageByAssets('main_mine_check.png'),
      ],
    ];


    _updateTitle();

    //_hasLogin();

  }

  //获取底部栏Icon
  Image _getTabIconByIndex(index){

    if(_currentPageIndex == index){
      return _tabIcons[index][1];
    }
    return _tabIcons[index][0];
  }

  //点击底部栏事件
  void _onBottomOnClick(index){
    PrintUtil.println("_onBottomOnClick: $index");
    if(index == _currentPageIndex)return;

    setState(() {
      _currentPageIndex = index;
      _tabController.animateTo(index, duration: Duration(milliseconds: 200), curve: Curves.linear);

      _updateTitle();
    });
  }

  //更新标题
  void _updateTitle(){
    appBarTitle = _tabs[_currentPageIndex].name;
    PrintUtil.println("App Bar Title: $appBarTitle");
  }

  void _hasLogin(){
      Routes.startPage(context, Routes.nameLogin);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _currentPageIndex==2?null:AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body:TabBarView(
          children: _pages,
          controller:_tabController,
          physics:new NeverScrollableScrollPhysics()
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: _tabs.map((BottomModel e){
          return new BottomNavigationBarItem(
            icon: _getTabIconByIndex(e.index),
            title: Padding(
                child:Text(e.name,style: TextStyle(fontWeight: FontWeight.bold)),
                padding: EdgeInsets.only(top: 6)
            ),
          );

        }).toList(),
        currentIndex: _currentPageIndex,
        onTap: _onBottomOnClick,
      ),
    );
  }
}



class BottomModel {
  int index;
  String name;

  BottomModel({this.name, this.index});
}