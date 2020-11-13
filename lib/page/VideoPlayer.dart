import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:chewie/chewie.dart';
import 'package:ciying/util/checkPermission.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:video_player/video_player.dart';
import 'bloc/CartBloc.dart';
import 'head_profile.dart';
import 'my_chewie_custom.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer(this._resourceSection);

  final ResourceSection _resourceSection;

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerState();
  }
}

class _VideoPlayerState extends State<VideoPlayer> {
  final CartBloc _cartBloc = new CartBloc();


  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  ProgressDialog pr;
  String downloadId;
  String _localPath;
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://y.yarn.co/11e873bc-2821-4f2e-a0e8-f28aca14e329_text.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      placeholder: Center(
        child: Text("正在缓冲",style: TextStyle(color: Colors.white),),
      ),
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      showControls: true,
      autoInitialize: true,
      customControls: MyChewieMaterialControls(),
    );
    _init();
  }

 Future<void> _init() async {
    await FlutterDownloader.initialize();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      print('UI Isolate Callback: $data');
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      print("status: $status");
      print("progress: $progress");
      print("id == downloadId: ${id == downloadId}");
    });
    FlutterDownloader.registerCallback(downloadCallback);

    _localPath = (await findLocalPath(context)) + '/Download';
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    print(
        'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
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
      title: widget._resourceSection.sourceName,
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
                child:Text(widget._resourceSection.sourceName, style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),),
              ),
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset("assets/images/logo.png"),
                  onPressed: () {
                       Navigator.pushNamed(context, '/UserProfile');
                  },
              );
            }),
            elevation: 0.0,
            backgroundColor: Colors.white,
            actions: <Widget>[
              UserHeaderProfile(),
            ],
          ),
      ),
    body: SizedBox(
      child: new Card(
        elevation: 1.0,  //设置阴影
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),  //设置圆角
        child: new Column(children: <Widget>[
         new Container(
          // height:  MediaQuery.of(context).size.height*0.88,
            // padding: EdgeInsets.all(10), 
            child:new Column(children: <Widget>[
              new Container(margin: EdgeInsets.only(top:0), child:
                 videoPlay(context),
              ),
                new Container(margin: EdgeInsets.only(top: 10.0), child:
                      new Text(widget._resourceSection.sourceName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black)),
                    ),
                    new Container(margin: EdgeInsets.only(top: 10), child:
                      new Text("来源：${widget._resourceSection.source}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey)),
                    ),
                  new Container(margin: EdgeInsets.only(top: 40, bottom: 40), child:
                    new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      new Text("详细", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                      new Padding(padding: EdgeInsets.only(top: 10), child: new Text(widget._resourceSection.duration.toString(), style: TextStyle(color: Colors.grey, fontSize: 18)))
                    ])
                  ),
                new Container(
                  decoration: BoxDecoration(
                  boxShadow:  [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 30.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      -20.0, // vertical, move down 10
                    ),
                  )
                ]), 
                padding: EdgeInsets.symmetric(horizontal: 20), 
                height: MediaQuery.of(context).size.height/10, 
                child:new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.favorite_border), label: new Text("")),
                    new SizedBox(
                        width: MediaQuery.of(context).size.width - 300, 
                        height:40,
                      child: new Align(alignment: Alignment.bottomCenter, 
                      child:new Container(
                          child:new RaisedButton(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                            // padding: EdgeInsets.all(10),
                              onPressed: () async {
                                 if (await checkPermission(context)) {
                                    final taskId = await FlutterDownloader.enqueue(
                                      url:  widget._resourceSection.resourceAddress,
                                      savedDir: _localPath,
                                      showNotification:
                                          true, // show download progress in status bar (for Android)
                                      openFileFromNotification:
                                          true, // click on notification to open downloaded file (for Android)
                                    );
                                    downloadId = taskId;
                                  }
                                // if(_cartBloc.currentCart.isEmpty || _urlList.length<=0)
                              },
                              child: new Text("一键下载", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))
                          )
                      ),  
                    )
                    )
                  ]),
              )
              ],
            ),
          ),
          ]
    )
  )
  )
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