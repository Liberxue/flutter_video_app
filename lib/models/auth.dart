import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel extends ChangeNotifier {
  String errorMessage = "";

  bool _rememberMe = false;
  bool _stayLoggedIn = true;
  bool _useBio = false;
  // User _user;

  bool get rememberMe => _rememberMe;

  void handleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("remember_me", value);
    });
  }

  bool get isBioSetup => _useBio;

  void handleIsBioSetup(bool value) {
    _useBio = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("use_bio", value);
    });
  }

  bool get stayLoggedIn => _stayLoggedIn;

  void handleStayLoggedIn(bool value) {
    _stayLoggedIn = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("stay_logged_in", value);
    });
  }

  void loadSettings() async {
    if (_stayLoggedIn) {
      // User _savedUser;
      // try {
      //   String _saved = _prefs.getString("user_data");
      //   print("Saved: $_saved");
      //   _savedUser = User.fromJson(json.decode(_saved));
      // } catch (e) {
      //   print("User Not Found: $e");
      // }
      // if (!kIsWeb && _useBio) {
      //   if (await biometrics()) {
      //     _user = _savedUser;
      //   }
      // } else {
      //   _user = _savedUser;
      // }
    }
    notifyListeners();
  }
}
