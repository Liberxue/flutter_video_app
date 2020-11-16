import 'dart:io';
import 'package:ciying/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
    // 强制竖屏
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
   if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.black);
    // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     systemNavigationBarColor:
  //         SystemUiOverlayStyle.dark.systemNavigationBarColor,
  //   ),
  // );
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark,
  //     statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
  //     systemNavigationBarColor: Colors.black,
  //     systemNavigationBarDividerColor: Colors.black,
  //     systemNavigationBarIconBrightness: Brightness.dark,
  // ));
     runApp(AppRouter());
  }
  
