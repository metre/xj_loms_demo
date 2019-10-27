import 'package:shared_preferences/shared_preferences.dart';
import 'package:xj_loms_manager/common/utils/print_util.dart';


class SharedPrefsUtil{

  static void putString(String key,String value) async{
    PrintUtil.println('SharedPref putString --> [key:$key | value:$value]');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static void putInt(String key,int value) async{
    PrintUtil.println('SharedPref putInt --> [key:$key | value:$value]');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static void putBool(String key,bool value) async{
    PrintUtil.println('SharedPref putBool --> [key:$key | value:$value]');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static void putDouble(String key,double value) async{
    PrintUtil.println('SharedPref putDouble  --> [key:$key | value:$value]');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  static void putStringList(String key,List<String> value) async{
    PrintUtil.println('SharedPref putStringList --> [key:$key | value:$value]');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  static Future<String> getString(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key);
    PrintUtil.println('SharedPref getString --> [key:$key | value:$value]');
    return value;
  }

  static Future<int> getInt(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(key);
    PrintUtil.println('SharedPref getInt --> [key:$key | value:$value]');
    return value;
  }
  static Future<double> getDouble(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double value = prefs.getDouble(key);
    PrintUtil.println('SharedPref getDouble --> [key:$key | value:$value]');
    return value;
  }

  static Future<bool> getBool(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key);
    PrintUtil.println('SharedPref getBool --> [key:$key | value:$value]');
    return value;
  }

  static Future<List<String>> getStringList(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> value = prefs.getStringList(key);
    PrintUtil.println('SharedPref getStringList --> [key:$key | value:$value]');
    return value;
  }
}