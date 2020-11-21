import 'dart:ui';
import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:chewie/chewie.dart';
import 'package:ciying/page/Search/search.dart';
import 'package:ciying/util/hexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:video_player/video_player.dart';
import 'my_chewie_custom.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer(this._resourceSection);

  final ResourceSection _resourceSection;

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerState();
  }
}

FToast fToast;

class _VideoPlayerState extends State<VideoPlayer> with WidgetsBindingObserver {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    //
    fToast = FToast();
    fToast.init(context);

    //  _videoPlayerController = VideoPlayerController.file(file)
    _videoPlayerController = VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      placeholder: Center(
        child: Text(
          "正在缓冲",
          style: TextStyle(color: Colors.white),
        ),
      ),
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      showControls: true,
      autoInitialize: true,
      customControls: MyChewieMaterialControls(),
    );
  }

  void _saveNetworkVideo() async {
    String albumName = "CiYing";
    String path =
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4';
    GallerySaver.saveVideo(path, albumName: albumName).then((bool success) {
      setState(() {
        print('Video is saved');
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return MaterialApp(
      title: widget._resourceSection.sourceName,
      debugShowCheckedModeBanner: CommonConfig.IsdebugShowCheckedModeBanner,
      theme: ThemeData.light().copyWith(
        platform: platform,
      ),
      home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              title: Container(
                color: Colors.white10,
                child: Text(
                  widget._resourceSection.sourceName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: HexColor("#252C4E"),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
                  },
                );
              }),
              elevation: 0.0,
              backgroundColor: Colors.white,
              // actions: <Widget>[
              //   // UserHeaderProfile(),
              // ],
            ),
          ),
          body: SizedBox(
              child: new Card(
                  // elevation: 1.0,  //设置阴影
                  // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),  //设置圆角
                  child: new Column(children: <Widget>[
            new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top: 0),
                    child: videoPlay(context),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: new Text(widget._resourceSection.sourceName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black)),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 10),
                    child: new Text("来源：${widget._resourceSection.source}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey)),
                  ),
                  new Container(
                      margin: EdgeInsets.only(top: 40, bottom: 40),
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text("详细",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            new Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: new Text(
                                    widget._resourceSection.duration.toString(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18)))
                          ])),
                  new Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius:
                            30.0, // has the effect of softening the shadow
                        spreadRadius:
                            5.0, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          -20.0, // vertical, move down 10
                        ),
                      )
                    ]),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height / 10,
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new FlatButton.icon(
                              onPressed: () {},
                              icon: new Icon(Icons.favorite_border),
                              label: new Text("收藏")),
                          new FlatButton.icon(
                              onPressed: () {
                                _saveNetworkVideo();
                                print("无水印下载");
                                // DialogPage();
                                fToast.showToast(
                                    child: new SizedBox(
                                      //限制进度条的高度
                                      height: 40.0,
                                      //限制进度条的宽度
                                      width: 40,
                                      child: new CircularProgressIndicator(
                                          //0~1的浮点数，用来表示进度多少;如果 value 为 null 或空，则显示一个动画，否则显示一个定值
                                          value: 0.3,
                                          //背景颜色
                                          backgroundColor: Colors.yellow,
                                          //进度颜色
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Colors.red)),
                                    ),
                                    toastDuration: Duration(seconds: 2),
                                    positionedToastBuilder: (context, child) {
                                      return Positioned(
                                        child: child,
                                        top: 16.0,
                                        left: 16.0,
                                      );
                                    });
                              },
                              icon: new Icon(Icons.download_outlined),
                              label: new Text("无水印下载")),
                        ]),
                  )
                ],
              ),
            ),
          ])))),
    );
  }

  Widget videoPlay(BuildContext context) {
    return Container(
      child: Center(
        child: Expanded(
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
