import 'dart:async';

import 'package:CiYing/common/constants.dart';
import 'package:CiYing/page/VideoPlayer.dart';
import 'package:CiYing/page/login.dart';
import 'package:CiYing/page/profile/profile.dart';
import 'package:CiYing/util/store.dart';
import 'package:flutter/material.dart';
import 'package:CiYing/models/image.dart' as DisplayImage;
import 'package:CiYing/page/search_list.dart';
import 'package:CiYing/util/network.dart';

class AppRouter extends StatefulWidget {
  @override
  _AppRouterState createState() {
    return _AppRouterState();
  }
}

class _AppRouterState extends State<AppRouter> {
  Timer _timer;
  bool _isLogin = false;
  @override
  void initState() {
    super.initState();
       _timer = Timer.periodic(Duration(seconds: 1), (_) {
          _getLoginState();
       });
  }

    _getLoginState() async {
    _isLogin = await Cache.checkLoginState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APPNAME,
      theme: ThemeData(
        // platform: TargetPlatform.iOS,
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        cursorColor: Colors.blueGrey,
        accentColor: Colors.blueGrey,
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => _isLogin ? SearchList(): Login() ,
        '/SearchList': (context) => _isLogin ? SearchList(): Login() ,
        '/UserProfile':(context) => _isLogin ? UserProfile(): Login(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'images') {
          String query = pathElements[2];
          DisplayImage.Image imageToDisplay =
              Storage.images.images[int.parse(pathElements[3])];
          return MaterialPageRoute(builder: (BuildContext context) {
            return  _isLogin ? VideoPlayer(query, "this's title"): Login();
          });
        } else {
          return null;
        }
      },
    );
  }
}
