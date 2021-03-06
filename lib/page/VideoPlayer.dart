import 'dart:io';
import 'dart:ui';

import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
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

class _VideoPlayerState extends State<VideoPlayer> with WidgetsBindingObserver {
  // final CartBloc _cartBloc = new CartBloc();
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  String firstButtonText = 'Take photo';
  String secondButtonText = 'Record video';
  double textSize = 20;
  String albumName ='CiYing';

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4');
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
  }
  void _saveNetworkVideo() async {
    String path =
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4';
    GallerySaver.saveVideo(path).then((bool success) {
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
      debugShowCheckedModeBanner: IsdebugShowCheckedModeBanner,
      theme: ThemeData.light().copyWith(
        platform: platform,
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
        // elevation: 1.0,  //设置阴影
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),  //设置圆角
        child: new Column(children: <Widget>[
         new Container(
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
                            padding: EdgeInsets.all(10),
                              onPressed: () async {
                                 _saveNetworkVideo();
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