import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

YYDialog dialogShow(String msg) {
  return YYDialog().build()
    ..width = 150
    ..height = 110
    ..backgroundColor = Colors.white.withOpacity(0.99)
    ..borderRadius = 10.0
    ..widget(Padding(
      padding: EdgeInsets.only(top: 21),
      child: Image.asset(
        'assets/images/logo.gif',
        width: 50,
        height: 50,
      ),
    ))
    ..widget(Padding(
      padding: EdgeInsets.only(top: 8),
      child: Text(
        msg,
        style: TextStyle(
          fontSize: 15,
          color: Colors.red,
        ),
      ),
    ))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..show();
}
