package com.genlot.plugin.amapplugin;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * Created by mi on 2019/5/31
 */
class AmapFactory extends PlatformViewFactory {

    private final  BinaryMessenger messenger;

    AmapFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @SuppressWarnings("unchecked")
    @Override
    public PlatformView create(Context context,  int id, Object params) {
        return new AmapPlatformView(context,id,(Map<String,Object>)params,messenger);
    }
}
