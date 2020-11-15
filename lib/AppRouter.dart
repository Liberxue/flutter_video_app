import 'package:ciying/common/constants.dart';
import 'package:ciying/page/login.dart';
import 'package:ciying/page/logout.dart';
import 'package:ciying/page/profile/profile.dart';
import 'package:ciying/page/search_list.dart';
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
  final ThemeModel _model = ThemeModel();
  final AuthModel _auth = AuthModel();
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
          // color: Colors.blueGrey,
          debugShowCheckedModeBanner: IsdebugShowCheckedModeBanner,
          theme: ThemeData(
            platform: TargetPlatform.iOS,
            primaryColor: Colors.blueGrey,
            scaffoldBackgroundColor: Colors.white,
            accentColor: Colors.blueGrey,
            primarySwatch: Colors.blueGrey,
          ),
      home: Consumer<AuthModel>(builder: (context, model, child) {
          // if (_isLogin) return SearchList();
          return SearchPage();
        }),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/Login': (context) => Login(),
        '/Search': (context) =>  SearchPage(),
        '/UserProfile':(context) => UserProfile(),
        '/Logout':(context) => Logout(),
      },
      ),
    ));
  }
}
