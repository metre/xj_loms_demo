package com.genlot.plugin.amapplugin;

import io.flutter.plugin.common.PluginRegistry.Registrar;

/** AmapPlugin */
public class AmapPlugin{
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {

  /*  final MethodChannel channel = new MethodChannel(registrar.messenger(), "amap_plugin");
    channel.setMethodCallHandler(new AmapPlugin());*/


    registrar.platformViewRegistry().registerViewFactory("plugins.metre.com/amapview",new AmapFactory(registrar.messenger()));

  }

/*  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }*/
}
