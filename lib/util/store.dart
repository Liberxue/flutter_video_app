import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static setCache(String key, String value) async {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(key, value);
    });
  }

  static Future<String> getCache(String key) async {
    var _prefs = await SharedPreferences.getInstance();
    String _rememberMe;
    try {
      _rememberMe = _prefs.getString(key);
    } catch (e) {
      print(e);
      _rememberMe = null;
    }
    return _rememberMe;
  }

  static deleteCache(String key) async {
    SharedPreferences sharePre = await SharedPreferences.getInstance();
    sharePre.remove(key);
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String _tokenKey = "Token";
    String token = sp.get(_tokenKey) as String;
    if (token == null) {
      return false;
    }
    return true;
  }

  static Future<String> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String _tokenKey = "Token";
    return sp.get(_tokenKey) as String;
  }
}
