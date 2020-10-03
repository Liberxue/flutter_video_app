import 'package:CiYing/common/const.dart';
import 'package:CiYing/page/HeaderMenuOptions.dart';
import 'package:flutter/material.dart';
import 'page/FooterOptions.dart';
import 'page/SearchPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      title: appName,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: HeaderMenuOptions(),
            ),
            Flexible(
              flex: 8,
              child: SearchPage(),
            ),
          ],
        ));
  }
}
