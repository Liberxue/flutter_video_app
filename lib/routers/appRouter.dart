import 'package:ciying/common/constants.dart';
import 'package:ciying/page/Search/search.dart';
import 'package:ciying/page/Search/search_list.dart';
import 'package:ciying/page/User/Login.dart';
import 'package:ciying/routers/single_screen.dart';
import 'package:flutter/material.dart';

class AppRouter extends StatefulWidget {
  @override
  _AppRouterState createState() {
    return _AppRouterState();
  }
}

class _AppRouterState extends State<AppRouter> {
  // bool _isLogin = true;
  // final AuthModel _auth = AuthModel();

  @override
  void initState() {
    super.initState();
  }

  // _getLoginState() async {
  //   _isLogin = await Cache.checkLoginState();
  //   _isLogin ? navigationPage() : Login();
  // }

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
    return MaterialApp(
      home: SingleScreen(), //启动页面
      debugShowCheckedModeBanner: CommonConfig.IsdebugShowCheckedModeBanner,
      routes: {
        '/Login': (context) => Login(),
        '/Search': (context) => SearchPage(),
        '/SearchList': (context, {searchText}) => SearchList(searchText),
        // '/VideoPlayer': (context, {searchText}) => VideoPlayer("", searchText),
      },
    );
  }
}