import 'package:flutter/material.dart';

Widget LoadMoreWidget() {
  return Center(
      // color: Colors.white,
      // height: 30,
      // width: 30,
      child: Padding(
    padding: const EdgeInsets.all(15.0), // 外边距
    child: new Center(child: new CircularProgressIndicator()),
  ));
}
