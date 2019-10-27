import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmapView extends StatefulWidget{

  MethodChannel _channel;
  AmapView(){
    _channel = const MethodChannel('amap_plugin');
  }

  void addTileOverlay(){
    _channel.invokeMethod("addTileOverlay");
  }


  void addMarker({String icon}){
    _channel.invokeMethod("addMarker",{"icon":icon});
  }

  @override
  State<StatefulWidget> createState() {
    return AmapViewState();
  }
}

class AmapViewState extends State<AmapView>{

  @override
  void initState() {
    super.initState();


  }



  @override
  Widget build(BuildContext context) {

    if (defaultTargetPlatform == TargetPlatform.android) {

      return AndroidView(viewType: 'plugins.metre.com/amapview',
          onPlatformViewCreated:_onPlatformViewCreated,
          creationParams: _creationParams(),
          //如果设置了creationParams参数，必须要设置creationParamsCodec
          creationParamsCodec: const StandardMessageCodec());

    }else if (defaultTargetPlatform == TargetPlatform.iOS) {

      return Text('The AmapView for IOS is comming soon！');
    }


    //该插件暂时还不支持该平台
    return Text(
        '$defaultTargetPlatform is not yet supported by the the amapview plugin!');
  }


  //封装参数
  Map<String, dynamic> _creationParams() {
    return <String, dynamic>{
      //'text': widget.text
    };
  }

  void _onPlatformViewCreated(id){

  }


}

class AmapViewController{
  final MethodChannel _channel;
  final AmapView _widget;

  AmapViewController._(int id, this._widget,) : _channel = MethodChannel('plugins.metre.com/amapview_$id'){
    //_channel.setMethodCallHandler(_methodCallHandler);
  }

  Future<bool> _methodCallHandler(MethodCall call) {
    switch (call.method) {
      case 'onClickListener':
        //_widget.onListener(_widget);
        return null;
    }
    //没有该回调，抛异常
    throw MissingPluginException(
        '${call.method} was invoked but has no handler!');
  }

}