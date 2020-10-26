import 'package:CiYing/common/constants.dart';
import 'package:CiYing/page/head_profile.dart';
import 'package:CiYing/page/search_list.dart';
import 'package:CiYing/util/screenshots.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player_controls/video_player_controls.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer(this.url, this.title);

  final String title;
  final String url;

  @override
  State<StatefulWidget> createState() => _VideoPlayereState();
}

class _VideoPlayereState extends State<VideoPlayer> {
  Controller controller;
  @override
  void initState() {
    super.initState();
    controller = new Controller(
      items: [
        new PlayerItem(
          title: 'video 1',
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        ),
        new PlayerItem(
          startAt: Duration(seconds: 2),
          title: 'video 2',
          aspectRatio: 16 / 4,
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        ),
        new PlayerItem(
          title: 'video 3',
          aspectRatio: 16 / 9,
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        ),
      ],
      autoPlay: true,
      errorBuilder: (context, message) {
        return new Container(
          child: new Text(message),
        );
      },
      // index: 2,
      autoInitialize: true,
      // isLooping: false,
      allowedScreenSleep: true,
      showControls: true,
      hasSubtitles: false,
      // isLive: true,
      // showSeekButtons: false,
      // showSkipButtons: false,
      allowFullScreen: false,
      fullScreenByDefault: false,
      placeholder: new Container(
        color: Colors.black,
      ),
      isPlaying: (isPlaying) {
        WatarMarkInstance instance = WatarMarkInstance();
        instance.addWatermark(context, "320321199708134818");
        Loading.show(context);
        //
        // print(isPlaying);
      },

      // playerItem: (playerItem) {
      //   // _title=playerItem.title;
      //   // print('Player title: ' + playerItem.title);
      //   // print('position: ' + playerItem.position.inSeconds.toString());
      //   // print('Duration: ' + playerItem.duration.inSeconds.toString());
      // },
      videosCompleted: (isCompleted) {
        Loading.hide(context);
        print(isCompleted);
      },
    );
  }

  @override
  void dispose() {
    Loading.hide(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: IsdebugShowCheckedModeBanner,  
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
               title: Container(
                color: Colors.white10,
                child:Text(widget.title, style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),),
              ),
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset("assets/images/logo.png"),
                  onPressed: () {
                     Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => SearchList(),
                    ));
                  },
              );
            }),
            elevation: 1.5,
            backgroundColor: Colors.white,
            actions: <Widget>[
              UserHeaderProfile(),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Center(
                  child: VideoPlayerControls(
                    controller: controller,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Padding(
                      child: Text("返回"),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        // _platform = TargetPlatform.iOS;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text("收藏"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class Loading {

  static void show(BuildContext context, {bool mateStyle}) {
    Navigator.of(context)
        .push(DialogRouter(LoadingDialog()));
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class DialogRouter extends PageRouteBuilder{

  final Widget page;

  DialogRouter(this.page)
      : super(
    opaque: false,
    barrierColor: Color(0x00000001),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
  );
}

class LoadingDialog extends Dialog {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Material(
          //创建透明层
          type: MaterialType.transparency, //透明类型
          child: Center(
            //保证控件居中效果
            child: CupertinoActivityIndicator(
              radius: 18,
            ),
          ),
        ),
        onWillPop: () async {
          return Future.value(false);
        });
  }
}