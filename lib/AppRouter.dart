
import 'package:ciying/common/constants.dart';
import 'package:ciying/page/login.dart';
import 'package:ciying/page/logout.dart';
import 'package:ciying/page/search_list.dart';
import 'package:ciying/util/store.dart';
import 'package:flutter/material.dart';
import 'package:persist_theme/persist_theme.dart';
import 'package:provider/provider.dart';

import 'models/auth.dart';

class AppRouter extends StatefulWidget {
  @override
  _AppRouterState createState() {
    return _AppRouterState();
  }
}

class _AppRouterState extends State<AppRouter> {
  bool _isLogin = false;
  final ThemeModel _model = ThemeModel();
  final AuthModel _auth = AuthModel();

  @override
  void initState() {
    _getLoginState();
  }

    _getLoginState() async {
    _isLogin = await Cache.checkLoginState();
     _isLogin ? navigationPage(): Login();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Search');
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider<ThemeModel>.value(value: _model),
          ChangeNotifierProvider<AuthModel>.value(value: _auth),
        ],
      child: Consumer<ThemeModel>(
      builder: (context, model, child) => MaterialApp(
          title: APPNAME,
          theme: ThemeData(
            // platform: TargetPlatform.iOS,
            primaryColor: Colors.blueGrey,
            scaffoldBackgroundColor: Colors.white,
            accentColor: Colors.blueGrey,
            primarySwatch: Colors.blueGrey,
          ),
      home: Consumer<AuthModel>(builder: (context, model, child) {
          if (_isLogin) return SearchPage();
          return Login();
        }),
      initialRoute: '/Login',
      routes: <String, WidgetBuilder>{
          '/Login': (context) => Login(),
          '/Search': (context) =>  SearchPage(),
          '/Logout':(context) => Logout(),
      },
          ),
        ));
  }
}