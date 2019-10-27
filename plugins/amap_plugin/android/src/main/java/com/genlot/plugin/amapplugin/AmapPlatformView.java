package com.genlot.plugin.amapplugin;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import com.amap.api.maps.AMap;
import com.amap.api.maps.CameraUpdateFactory;
import com.amap.api.maps.MapView;
import com.amap.api.maps.UiSettings;
import com.amap.api.maps.model.BitmapDescriptorFactory;
import com.amap.api.maps.model.CameraPosition;
import com.amap.api.maps.model.HeatmapTileProvider;
import com.amap.api.maps.model.LatLng;
import com.amap.api.maps.model.MarkerOptions;
import com.amap.api.maps.model.MyLocationStyle;
import com.amap.api.maps.model.TileOverlayOptions;
import com.amap.api.maps.model.WeightedLatLng;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

/**
 * Created by mi on 2019/5/31
 */
class AmapPlatformView implements PlatformView,MethodChannel.MethodCallHandler  {

    private Context context;

    private MethodChannel channel;

    private MapView mMapView;             //地图控制器
    private AMap mAMap;             //地图控制器

    private int mZoomLevel = 16;        //地图缩放级别3-19


    AmapPlatformView(Context context, int id, Map<String, Object> params, BinaryMessenger messenger) {
        this.context = context;
        mMapView =  new MapView(context);
        channel = new MethodChannel(messenger, "amap_plugin");
        channel.setMethodCallHandler(this);

        initMap(Bundle.EMPTY);
    }


    /**
     * 地图初始化
     */
    private void initMap(Bundle state) {
        //mMapView.setVisibility(View.INVISIBLE);
        mMapView.onCreate(state);
        UiSettings uiSettings;          //界面空间设置
        if (mAMap == null) {
            mAMap = mMapView.getMap();
        }
       /* mClusterOverlay = new ClusterOverlay(mAMap, null,
                mControl.dp2px(getContext(), clusterRadius),
                getContext());
        mClusterOverlay.setOnClusterClickListener(mClusterClickListener);
        mAMap.setOnMapLoadedListener(() -> mControl.setClusterRender(getContext(), mClusterOverlay, mBackDrawAbles));*/
        uiSettings = mAMap.getUiSettings();
        uiSettings.setZoomControlsEnabled(false);        //缩放按钮
        mAMap.animateCamera(CameraUpdateFactory.zoomTo(mZoomLevel));       //设置缩放级别3-19
        mAMap.setOnCameraChangeListener(new AMap.OnCameraChangeListener() {
            @Override
            public void onCameraChange(CameraPosition cameraPosition) {

            }

            @Override
            public void onCameraChangeFinish(CameraPosition cameraPosition) {
                mZoomLevel = (int) cameraPosition.zoom;

            }
        });

        toMyLocation();
        mAMap.setMyLocationEnabled(true);               // 可触发定位并显示当前位置
        //mMapView.setVisibility(View.VISIBLE);
    }

    /**
     * 定位到当前位置
     */
    @SuppressLint("CheckResult")
    private void toMyLocation() {
        MyLocationStyle locationStyle = new MyLocationStyle();
        locationStyle.myLocationType(MyLocationStyle.LOCATION_TYPE_LOCATE);//定位一次，且将视角移动到地图中心点。
        mAMap.setMyLocationStyle(locationStyle);    //设置定位蓝点的Style

    }

    @Override
    public View getView() {
        return mMapView;
    }

    @Override
    public void dispose() {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {

        switch (call.method){
            case "addTileOverlay":

                addTitleOverlay();

                break;
            case "addMarker":

                addMarker(call.arguments);

                break;
        }


    }

    @SuppressWarnings("unchecked")
    private void addMarker(Object args){
        //mAMap.clear();
        Map<String,String> params;
        String icon = null;
        if(args != null){
            params = (Map<String,String>)args;
            icon = params.get("icon");
            Log.d("amap_plugin","icon---->"+icon);
        }

        double x = 39.904979;
        double y = 116.40964;

        double x_ = Math.random() * 0.5 - 0.25;
        double y_ = Math.random() * 0.5 - 0.25;


        LatLng latlng = new LatLng(x + x_, y + y_);


        Bitmap bitmap = null;
        try {
            InputStream input = context.getAssets().open("flutter_assets/assets/"+icon);
            Log.d("amap_plugin","input---->"+input);
            bitmap = BitmapFactory.decodeStream(input);

        } catch (IOException e) {
            e.printStackTrace();
        }




/*
        int iconId = context.getResources().getIdentifier(icon,"mipmap",context.getPackageName());
        int drawableId = context.getResources().getIdentifier(icon,"drawable",context.getPackageName());
        Log.d("amap_plugin","iconId---->"+iconId);
        Log.d("amap_plugin","drawableId---->"+drawableId);*/

        //bitmap = BitmapFactory.decodeResource(context.getResources(), iconId);

        MarkerOptions markerOption = new MarkerOptions().icon(
                BitmapDescriptorFactory.fromBitmap(bitmap))
                .position(latlng)
                .draggable(true);
        mAMap.addMarker(markerOption);
    }

    private void addTitleOverlay(){
        mAMap.clear();

        HeatmapTileProvider.Builder builder = new HeatmapTileProvider.Builder();
        //builder.weightedData(weightedLatLngs);
        builder.weightedData(getArrays());
        //builder.data(Arrays.asList(getArrays()));

        // 构造热力图对象
        HeatmapTileProvider heatmapTileProvider = builder.build();

        // 初始化 TileOverlayOptions
        TileOverlayOptions tileOverlayOptions = new TileOverlayOptions();
        tileOverlayOptions.tileProvider(heatmapTileProvider); // 设置瓦片图层的提供者
        // 向地图上添加 TileOverlayOptions 类对象

        mAMap.addTileOverlay(tileOverlayOptions);
    }

    private List<WeightedLatLng> getArrays(){

        List<WeightedLatLng> weightedLatLngs = new ArrayList<>();


        LatLng[] latlngs = new LatLng[150];
        double x = 39.904979;
        double y = 116.40964;

        for (int i = 0; i < 100; i++) {
            double x_ = Math.random() * 0.5 - 0.25;
            double y_ = Math.random() * 0.5 - 0.25;
            latlngs[i] = new LatLng(x + x_, y + y_);

            weightedLatLngs.add(new WeightedLatLng(latlngs[i], Math.random()));
        }
        return  weightedLatLngs;
    }
}
