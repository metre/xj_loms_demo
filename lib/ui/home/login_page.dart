import 'package:flutter/material.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/common/utils/route_util.dart';
import 'package:xj_loms_manager/common/utils/toast_util.dart';
import 'package:xj_loms_manager/common/utils/util.dart';
import 'package:xj_loms_manager/net/login_net.dart';

class LoginPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => LoginPageState();




}


class LoginPageState extends State<LoginPage>{
  TextEditingController userNameController = new TextEditingController(text:"13900000001");
  TextEditingController pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    /**
        prefixIcon:Util.getImage('ic_user_account.png', 16, 16),
        suffixIcon: Util.getImage('search_cancel.png', 16, 16)
     */
    //用户名输入框
    TextField useNameText = TextField(
        controller: userNameController,
        autofocus: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            icon: Icon(Icons.person, color: Colors.white),
            hintText: "用户名",
            hintStyle: TextStyle(color: Colors.white)));

    //密码输入框
    TextField pwdText = TextField(
        controller: pwdController,
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock, color: Colors.white), hintText: "密码"));

    Widget view = ListView(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 60),
            child: Util.getImage('ic_head.png', 180, 180)),
        Padding(
            padding: EdgeInsets.only(top: 20, left: 40, right: 40),
            child: useNameText),
        Padding(
            padding: EdgeInsets.only(top: 20, left: 40, right: 40),
            child: pwdText),
        Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: OutlineButton(
              onPressed: () {
                _login();
              },
              child: Text("登录",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            )),
      ],
    );

    return Scaffold(
        body: Container(
            child: view,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.lightBlue]),
            )));
  }

  void _login(){

    String userName = userNameController.text;
    String pwd = pwdController.text;
    PrintUtil.println("userName --> $userName");
    PrintUtil.println("pwd -------> $pwd");



    LoginNet net = LoginNet();
    net.login(context, userName, pwd,(res){
      String code = res['code'];
      if(code == "0"){
        Routes.goBack(context);
      }else{
        String msg = res['msg'];
        ToastUtil.show(context,msg);
      }
    });
  }
}
