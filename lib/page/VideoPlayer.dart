import 'package:CiYing/common/constants.dart';
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
      allowedScreenSleep: false,
      // showControls: false,
      hasSubtitles: true,
      // isLive: true,
      // showSeekButtons: false,
      // showSkipButtons: false,
      // allowFullScreen: false,
      fullScreenByDefault: false,
      // placeholder: new Container(
      //   color: Colors.grey,
      // ),
      isPlaying: (isPlaying) {
        //
        // print(isPlaying);
      },

      playerItem: (playerItem) {
        // print('Player title: ' + playerItem.title);
        // print('position: ' + playerItem.position.inSeconds.toString());
        // print('Duration: ' + playerItem.duration.inSeconds.toString());
      },
      videosCompleted: (isCompleted) {
        print(isCompleted);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            // automaticallyImplyLeading: true, // hides leading widget
            title: Text(
              APPNAME + "搜索",
              style: TextStyle(fontSize: 20, height: 2, color: Colors.black45),
            ),
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset("assets/images/logo.png"),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context)
                    .openAppDrawerTooltip, //打开抽屉drawer
              );
            }),
            elevation: 1.5,
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.black,
                  onPressed: () {}),
              Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: RaisedButton(
                  elevation: 0.5,
                  color: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    '登录',
                    style: TextStyle(
                        fontFamily: 'arial',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
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
