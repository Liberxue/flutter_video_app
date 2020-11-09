import 'package:ciying/common/constants.dart';
import 'package:ciying/page/login.dart';
import 'package:ciying/page/logout.dart';
import 'package:ciying/page/profile/profile.dart';
import 'package:ciying/util/store.dart';
import 'package:flutter/material.dart';
import 'package:ciying/page/search_list.dart';
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
  // bool _isLogin = false;
  //  @override
  // void initState() {
  //   _getLoginState();
  // }

  //   _getLoginState() async {
  //   _isLogin = await Cache.checkLoginState();
  // }

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
          color: Colors.blueGrey,
          debugShowCheckedModeBanner: IsdebugShowCheckedModeBanner,
          theme: ThemeData(
            platform: TargetPlatform.iOS,
            primaryColor: Colors.blueGrey,
            scaffoldBackgroundColor: Colors.white,
            cursorColor: Colors.blueGrey,
            accentColor: Colors.blueGrey,
            primarySwatch: Colors.blueGrey,
          ),
      home: Consumer<AuthModel>(builder: (context, model, child) {
          // if (_isLogin) return SearchList();
          return SearchList();
        }),
      // initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // '/Login': (context) => _isLogin ? SearchList(): Login(),
        // '/SearchList': (context) => _isLogin ? SearchList(): Login() ,
        // '/UserProfile':(context) => _isLogin ? UserProfile(): Login(),
        '/Login': (context) => Login(),
        '/SearchList': (context) =>  SearchList(),
        '/UserProfile':(context) => UserProfile(),
        '/Logout':(context) => Logout(),
      },
      // onGenerateRoute: (RouteSettings settings) {
      //   print("settingssettingssettingssettingssettings");
      //   print(settings);
      // final List<String> pathElements = settings.name.split('/');
      //   if (pathElements[0] != '') {
      //     return null;
      //   }
      //   if (pathElements[1] == 'images') {
      //     String query = pathElements[2];
      //     print(query);
      //   //   DisplayImage.Image imageToDisplay =
      //   //       Storage.images.images[int.parse(pathElements[3])];
      //     // return MaterialPageRoute(builder: (BuildContext context) {
      //     //   // print(_resourceSection);
      //     //   // return null;
      //     //   return  VideoPlayer(query, "this's title");
      //     // });
      //   } else {
      //     return null;
      //   }
      //       },
          ),
        ));
  }
}
