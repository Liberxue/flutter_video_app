import 'dart:io';
import 'package:ciying/appRouter.dart';
import 'package:ciying/cache/database.dart';
import 'package:ciying/cache/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cache/entity/resource_section.dart';

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
  final resourceSectionDao = database.resourceSectionDao;

  final resourceSection = ResourceSection(
    "resourceId",
    0.1,
    "sourceName",
    1,
    "resourceAddress",
    "sourceId",
    true,
    false,
    "name",
    "resourceAddressCachePath",
  );
  await resourceSectionDao.insertResourceSection(resourceSection);

  final result = await resourceSectionDao.findAllResourceSection();
  List<ResourceSection> resourceSectionData = result;
  print(resourceSectionData);
}
