import 'dart:convert';

import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheSearch {
  Future<void> saveSearchData(List<ResourceSection> _resourceSection) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result =
        await prefs.setString('resourceSection', json.encode(_resourceSection));
    print(result);
  }

  // Future<User> getSearchData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   Map<String, dynamic> userMap;
  //   final String userStr = prefs.getString('user');
  //   if (userStr != null) {
  //     userMap = jsonDecode(userStr) as Map<String, dynamic>;
  //   }

  //   if (userMap != null) {
  //     final User user = User.fromJson(userMap);
  //     print(user);
  //     return user;
  //   }
  //   return null;
  // }
}
