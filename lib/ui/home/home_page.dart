import 'package:amap_plugin/ui/amap_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';
import 'package:xj_loms_manager/common/utils/toast_util.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }

}
class _MyHomePageState extends State<HomePage>{

  String _url = "http://10.8.0.106:8182/#/local";
  //String _url = "http://10.36.0.21:8087/#/local";


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    AmapView amapView = AmapView();


    return Center(
      child: Stack(
        children: <Widget>[
          amapView,
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            RaisedButton(
                child: Text("点聚合"),
                onPressed: () {
                  amapView.addMarker(icon:"icon_station_pos.png");
                }),
            RaisedButton(
                child: Text("热力图"),
                onPressed: () {
                  amapView.addTileOverlay();
                }),
            //Image.asset('assets/new_pos.png', width: 24.0, height: 24.0),
          ]),
        ],
      ),
    );



    /*return Stack(children: <Widget>[

      WebView(
        onWebViewCreated:_onWebViewCreated,
        //navigationDelegate:_navigationDelegate,
        javascriptChannels:<JavascriptChannel>[
          _jsHandler(),
        ].toSet(),
        initialUrl: _url,
        onPageFinished: (url){
          PrintUtil.println("WebView onPageFinished -->url:$url");
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),

      RaisedButton(child:Text("调用Js"),onPressed:(){
        _controller.evaluateJavascript('callJS1("Flutter 调用 JS ")');
        _controller.evaluateJavascript('testEvent("Flutter 调用 JS ")');
        _controller.evaluateJavascript('callJS("Flutter 调用 JS ")');
      }),



    ]);*/
  }


//第一种方式
  JavascriptChannel _jsHandler(){

    return JavascriptChannel(
        name: "xjLomsFlutter",
        onMessageReceived: (mes){
          PrintUtil.println("=============message:${mes.message}");
          ToastUtil.show(context, mes.message);
        }
    );
  }

  //第二种方式
  NavigationDecision _navigationDelegate(NavigationRequest request){
    //document.location = "js://webview?arg1=111&args2=222";
    if(request.url.startsWith("js://webview")){
      PrintUtil.println("========JS调用了Flutter=====${request.url}");
    }
  }

  WebViewController _controller;

  void _onWebViewCreated( controller){
    _controller = controller;
  }




}