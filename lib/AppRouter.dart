import 'package:CiYing/common/constants.dart';
import 'package:CiYing/page/LoginScreen.dart';
import 'package:CiYing/page/VideoPlayer.dart';
import 'package:CiYing/util/store.dart';
import 'package:flutter/material.dart';
import 'package:CiYing/models/image.dart' as DisplayImage;
import 'package:CiYing/page/search_list.dart';
import 'package:CiYing/util/network.dart';

class AppRouter extends StatefulWidget {
  _AppRouterState createState() {
    return _AppRouterState();
  }
}

class _AppRouterState extends State<AppRouter> {
String Token="";
  @override
  void initState() {
    super.initState();
    this._loadIsLoginData();
  }
  void _loadIsLoginData()async{
    final token = await getMethod("token");
    setState(() {
      Token = token;
      print("gent store Token------\r\n"+Token);
    });
    if(Token.length>0){
      SearchList();
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APPNAME,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        cursorColor: Colors.blueGrey,
        accentColor: Colors.blueGrey,
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/login',
      routes: {
        // '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/': (context) => SearchList(),
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
            return VideoPlayer("this's url ", "this's title");
          });
        } else {
          return null;
        }
      },
    );
  }
}
