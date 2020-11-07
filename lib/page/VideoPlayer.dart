import 'package:CiYing/common/constants.dart';
import 'package:CiYing/grpc/proto/search.pb.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
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

            new Container(margin: EdgeInsets.only(top: 20), child:
                  new Text(widget._resourceSection.sourceName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black)),
                ),
                new Container(margin: EdgeInsets.only(top: 10), child:
                  new Text("来源：${widget._resourceSection.source}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey)),
                ),

              new Container(margin: EdgeInsets.only(top: 40, bottom: 40), child:
                new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  new Text("详细", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                  new Padding(padding: EdgeInsets.only(top: 10), child: new Text(widget._resourceSection.source, style: TextStyle(color: Colors.grey, fontSize: 18)))
                ])
              ),

             new Container(decoration: BoxDecoration(boxShadow:  [
              BoxShadow(
                color: Colors.white,
                blurRadius: 30.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  -20.0, // vertical, move down 10
                ),
              )
            ])
            , padding: EdgeInsets.symmetric(horizontal: 20), height: MediaQuery.of(context).size.height*0.1, child:
              new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.favorite_border), label: new Text("")),
                new SizedBox(width: MediaQuery.of(context).size.width * 0.6, child:
                  new RaisedButton(color: Colors.amber, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)), padding: EdgeInsets.all(20),
                      onPressed: (){
                        _cartBloc.addOrderToCart(widget._resourceSection);
                        Navigator.of(context).pop();
                      },
                      child: new Text("添加下载列表", style: TextStyle(fontWeight: FontWeight.bold))
                  )
                )
              ]),
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