import 'package:CiYing/common/constants.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'head_profile.dart';
import 'my_chewie_custom.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer(this.url, this.title);

  final String title;
  final String url;

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerState();
  }
}

class _VideoPlayerState extends State<VideoPlayer> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      placeholder: Center(
        child: Text("正在缓冲",style: TextStyle(color: Colors.white30),),
      ),
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      showControls: true,
      autoInitialize: true,
      customControls: MyChewieMaterialControls(),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      debugShowCheckedModeBanner: IsdebugShowCheckedModeBanner,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
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
            // leading: Builder(builder: (BuildContext context) {
            //   return IconButton(
            //     icon: Image.asset("assets/images/logo.png"),
            //       onPressed: () {
            //               Navigator.pushNamed(context, '/UserProfile');
            //       },
            //   );
            // }),
            elevation: 1.5,
            backgroundColor: Colors.white,
            actions: <Widget>[
              UserHeaderProfile(),
            ],
          ),
      ),
        body: Column(
          children: <Widget>[
            videoPlay(context),
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
  Widget videoPlay(BuildContext context) {
    return Container(
              child: Center(
                  child:Expanded(
                  child: Center(
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),
                ),
              ),
            );
  }
  
}