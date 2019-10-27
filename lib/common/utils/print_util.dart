class PrintUtil {
  static bool _hasLog = true;

  static void println(Object obj) {

    if(_hasLog)
      print(obj);
  }
}
