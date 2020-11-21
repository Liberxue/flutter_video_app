import 'package:ciying/page/User/Login.dart';
import 'package:ciying/util/store.dart';
import 'package:flutter/material.dart';

void LoginOut(BuildContext context) async {
  bool result = await Cache.deleteCache("Token");
  if (result) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Login(), maintainState: false));
  }
}

// void CleanCache() {
//   bool result = await Cache.deleteCache("Token");
// }
