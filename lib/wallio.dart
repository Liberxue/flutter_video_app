import 'package:CiYing/common/constants.dart';

import 'package:CiYing/page/VideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:CiYing/models/image.dart' as DisplayImage;
import 'package:CiYing/page/browse_images.dart';
import 'package:CiYing/util/network.dart';

class Wallio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APPNAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // '/signup': (context) => SignUpScreen(),
        // '/login': (context) => LoginScreen(),
        '/': (context) => BrowseImages(),
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
