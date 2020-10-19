
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static setCache(String key,String value) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(key, value);
  }

 static Future<String> getCache(String key) async{
    SharedPreferences sharePre = await SharedPreferences.getInstance();
    return sharePre.get(key);
  }
 
  static deleteCache(String key) async{
    SharedPreferences sharePre = await SharedPreferences.getInstance();
    sharePre.remove(key);
  }
  static Future<bool> checkLoginState() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String _tokenKey = "token";
    String token = sp.get(_tokenKey) as String;
    if(token == null) {
      return false;
    }
    return true;
  }
}