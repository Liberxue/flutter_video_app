import 'package:ciying/common/AppConfig.dart';
import 'package:ciying/common/constants.dart';
// import 'package:ciying/page/login.dart';
import 'package:ciying/page/Search/search.dart';
import 'package:ciying/page/User/Login.dart';
import 'package:ciying/Utils/store.dart';
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
    super.initState();
    _getLoginState();
  }

  _getLoginState() async {
    _isLogin = await Cache.checkLoginState();
    _isLogin ? navigationPage() : Login();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Search');
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => SearchPage(),
    // ));
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
            title: CommonConfig.ConfAppName,
            theme: ThemeData(
              primaryColor: AppDesignCourseAppTheme.BackgroundColor,
              scaffoldBackgroundColor: AppDesignCourseAppTheme.BackgroundColor,
            ),
            home: Consumer<AuthModel>(builder: (context, model, child) {
              if (_isLogin) return SearchPage();
              return Login();
            }),
            initialRoute: '/',
            routes: <String, WidgetBuilder>{
              '/Login': (context) => _isLogin ? SearchPage() : Login(),
              '/Search': (context) => _isLogin ? SearchPage() : Login(),
            },
            // onGenerateRoute: (RouteSettings settings) {
            //   final List<String> pathElements = settings.name.split('/');
            //   if (pathElements[1] == 'VideoPlayer') {
            //     // String query = pathElements[2];
            //     return MaterialPageRoute(builder: (BuildContext context) {
            //       return _isLogin ? VideoPlayer(null) : Login();
            //     });
            //   } else {
            //     return null;
            //   }
            // },
          ),
        ));
  }
}
