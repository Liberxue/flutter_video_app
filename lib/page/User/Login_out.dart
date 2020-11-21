import 'package:ciying/page/User/Login.dart';
import 'package:ciying/util/store.dart';
import 'package:flutter/material.dart';

Future<bool> LoginOut(BuildContext context) async {
  bool result = await Cache.deleteCache("Token");
  if (result) {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => Login(), maintainState: false));
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new Login()),
        (route) => route == null); //修复退出右滑返回首页
  } else {
    result = await Cache.deleteCache("Token");
  }
  return result;
}

// void CleanCache() {
//   bool result = await Cache.deleteCache("Token");
// }
