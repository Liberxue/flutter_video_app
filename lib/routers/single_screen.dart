import 'package:animated_text/animated_text.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class SingleScreen extends StatefulWidget {
  @override
  _SingleScreenState createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen>
    with SingleTickerProviderStateMixin {
  bool play = true;
// 声明视频控制器
  // VideoPlayerController _controller;
  var _iconAnimationController;
  var _iconAnimation;
  //
  // final String videoUrl =
  //     "https://video.pearvideo.com/mp4/third/20190730/cont-1584187-10136163-164150-hd.mp4";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#14225B"),
      // padding: const EdgeInsets.only(top: 300),
      child: Stack(
        children: <Widget>[
          // new Container(
          //     color: Colors.white,
          //     // child: Image.network(
          //     //   'http://img.wxcha.com/file/201606/30/1978c43117.jpg',
          //     //   fit: BoxFit.cover,
          //     // ),
          //     child: new Image(
          //       image: new AssetImage("assets/images/logo.png"),
          //       fit: BoxFit.cover,
          //     )),
          new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/start.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 300),
              child: AnimatedText(
                alignment: Alignment.center,
                speed: Duration(milliseconds: 750),
                controller: AnimatedTextController.play,
                displayTime: Duration(milliseconds: 750),
                wordList: ['欢迎回来', '台词搜索 自动配音', '智能视频分层 情感行为分析', '视频场景AI解析恢复'],
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Stack(
  //     fit: StackFit.expand,
  //     children: <Widget>[
  //       Transform.scale(
  //         scale: _controller.value.aspectRatio /
  //             MediaQuery.of(context).size.aspectRatio *
  //             1.01,
  //         child: Center(
  //           child: Container(
  //             child: _controller.value.initialized
  //                 ? AspectRatio(
  //                     aspectRatio: _controller.value.aspectRatio,
  //                     child: VideoPlayer(_controller),
  //                   )
  //                 : Text("欢迎回来"),
  //           ),
  //         ),
  //       ),
  //       Positioned(
  //         width: MediaQuery.of(context).size.width,
  //         bottom: 300.0,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             SizedBox(
  //               height: 100.0,
  //             ),
  //             Container(
  //               height: 44.0,
  //               width: 240.0,
  //               child: Center(
  //                 child: AnimatedText(
  //                   alignment: Alignment.center,
  //                   speed: Duration(milliseconds: 750),
  //                   controller: AnimatedTextController.play,
  //                   displayTime: Duration(milliseconds: 750),
  //                   wordList: ['词影', '台词搜索', '美文朗读', '自定义搜索素材'],
  //                   textStyle: TextStyle(
  //                       color: HexColor("#1C284E"),
  //                       fontSize: 30,
  //                       fontWeight: FontWeight.w700),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Positioned(
  //         width: MediaQuery.of(context).size.width,
  //         top: 100.0,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 Container(
  //                   width: 48,
  //                   height: 48,
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.rectangle,
  //                       image: DecorationImage(
  //                           fit: BoxFit.contain,
  //                           image: AssetImage('assets/images/logo.png'))),
  //                 ),
  //                 Text(
  //                   "IYING",
  //                   style: TextStyle(
  //                     fontSize: 50,
  //                     fontWeight: FontWeight.bold,
  //                     color: HexColor("#1C284E"),
  //                     letterSpacing: 1,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   ));
  // }

  void initState() {
    super.initState();
    conutDown();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    // _controller = VideoPlayerController.network(videoUrl)
    //   ..initialize().then((_) {
    //     setState(() {});
    //     _controller.play();
    //     _controller.setLooping(true);
    //     _controller.setVolume(0.0);
    //     // Timer.periodic(Duration(seconds: 5), (Timer time) {
    //     //   print(time);
    //     // });
    //   });
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.pause();
    // _controller.dispose();
  }

  void conutDown() {
    var _duration = Duration(seconds: 5);
    Future.delayed(_duration, newPage);
  }

  void newPage() {
    Navigator.of(context).pushReplacementNamed('/Search');
  }
}
