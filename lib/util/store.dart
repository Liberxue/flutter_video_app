
import 'package:shared_preferences/shared_preferences.dart';


  Future saveMethod(String key,String value) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(key, value);
  }

  Future<String> getMethod(String key) async{
    SharedPreferences sharePre = await SharedPreferences.getInstance();
    return sharePre.get(key);
  }
 
  Future deleteMethod(String key) async{
    SharedPreferences sharePre = await SharedPreferences.getInstance();
    sharePre.remove(key);
  }
