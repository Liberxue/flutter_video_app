import 'dart:io';
import 'package:ciying/appRouter.dart';
import 'package:ciying/cache/database.dart';
import 'package:ciying/cache/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cache/entity/person.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // fix [VERBOSE-2:ui_dart_state.cc Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized.
  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.white);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(AppRouter());
  CacheDb();
}

Future<void> CacheDb() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final personDao = database.personDao;

  final person = Person(1, 'Frank');
  await personDao.insertPerson(person);

  final result = await personDao.findPersonById(1);
  print(result);
}
