import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/src/material_progress_bar.dart';

class MyChewieMaterialControls extends StatefulWidget {
  const MyChewieMaterialControls({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyChewieMaterialControlsState();
  }
}

class _MyChewieMaterialControlsState extends State<MyChewieMaterialControls> {
  VideoPlayerValue _latestValue;
  // double _latestVolume;
  bool _hideStuff = true;
  Timer _hideTimer;
  Timer _initTimer;
  Timer _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;

  final barHeight = 60.0;
  final marginSize = 5.0;

  VideoPlayerController controller;
  ChewieController chewieController;

  @override
  Widget build(BuildContext context) {
    if (_latestValue.hasError) {
      return chewieController.errorBuilder != null
          ? chewieController.errorBuilder(
              context,
              chewieController.videoPlayerController.value.errorDescription,
            )
          : Center(
              child: Icon(
                Icons.error,
                color: Colors.white,
                size: 42,
              ),
            );
    }
    return MouseRegion(
      onHover: (_) {
        _cancelAndRestartTimer();
      },
      child: GestureDetector(
        onTap: () => _cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: _hideStuff,
          child: Column(
            children: <Widget>[
              _buildWatarmarkBar(context),
              _latestValue != null &&
                          !_latestValue.isPlaying &&
                          _latestValue.duration == null ||
                      _latestValue.isBuffering
                  ? const Expanded(
                      child: const Center(
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : _buildHitArea(),
              _buildBottomBar(context),
            ],
          ),
        ),
      ),
    );
  }

  void _dispose() {
    controller.removeListener(_updateState);
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final _oldController = chewieController;
    chewieController = ChewieController.of(context);
    controller = chewieController.videoPlayerController;

    if (_oldController != chewieController) {
      _dispose();
      _initialize();
    }

    super.didChangeDependencies();
  }

  AnimatedOpacity _buildWatarmarkBar(BuildContext context) {
    return AnimatedOpacity(
      opacity: _dragging ? 0.0 : 0.9,
      duration: Duration(milliseconds: 300),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 90,
            ),
            child: PhysicalModel(
              color: Colors.transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10.1,
              shadowColor: Colors.red,
              child: Image.asset(
                "assets/images/watarmar.png",
                width: 120,
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedOpacity _buildBottomBar(
    BuildContext context,
  ) {
    // final iconColor = Theme.of(context).textTheme.button.color;
    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1,
      duration: Duration(milliseconds: 300),
      child: Container(
        height: barHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(0, 0, 0, 0.02), Colors.black]),
        ),
        child: Row(
          children: <Widget>[
            _buildPlayPause(controller),
            chewieController.isLive ? const SizedBox() : _buildProgressBar(),
            // chewieController.isLive
            //     ? Expanded(
            //         child: const Text(
            //         '直播',
            //         style: TextStyle(color: Colors.white),
            //       ))
            //     : _buildPosition(context),
            chewieController.allowFullScreen == false
                ? _buildExpandButton()
                : Container(),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildExpandButton() {
    return GestureDetector(
      onTap: _onExpandCollapse,
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: Duration(milliseconds: 300),
        child: Container(
          height: barHeight,
          margin: EdgeInsets.only(right: 12.0),
          padding: EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Center(
            child: Icon(
              chewieController.isFullScreen
                  ? Icons.fullscreen_exit
                  : Icons.fullscreen,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // Expanded _buildHitArea() {
  //   return Expanded(
  //     child: GestureDetector(
  //       onTap: () {
  //         if (_latestValue != null && _latestValue.isPlaying) {
  //           if (_displayTapped) {
  //             setState(() {
  //               _hideStuff = true;
  //             });
  //           } else
  //             _cancelAndRestartTimer();
  //         } else {

  //           setState(() {
  //             _hideStuff = true;
  //           });
  //         }
  //       },
  //       onDoubleTap: (){
  //         _playPause();
  //       },
  //       child: Container(
  //         color: Colors.transparent,
  //         child: Container(
  //         alignment: Alignment.bottomRight,
  //           child: AnimatedOpacity(
  //             opacity:
  //                 _latestValue != null && !_latestValue.isPlaying && !_dragging
  //                     ? 0.8
  //                     : 0.0,
  //             duration: Duration(milliseconds: 300),
  //             child: GestureDetector(
  //               onTap: () {
  //                 _playPause();
  //               },
  //                 child: Center(
  //                   // margin: EdgeInsets.all(40),
  //                 // decoration: BoxDecoration(
  //                   // boxShadow: <BoxShadow>[
  //                   //   BoxShadow(
  //                   //     color: Colors.black54,
  //                   //     blurRadius: 20
  //                   //   ),
  //                   // ],
  //                 // ),
  //                 child: Icon(Icons.play_arrow,size: 30.0,color: Colors.white,),
  //               )
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Expanded _buildHitArea() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_latestValue != null && _latestValue.isPlaying) {
            if (_displayTapped) {
              setState(() {
                _hideStuff = true;
              });
            } else
              _cancelAndRestartTimer();
          } else {
            setState(() {
              _hideStuff = true;
            });
          }
        },
        onDoubleTap: () {
          _playPause();
        },
        child: Container(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.bottomRight,
            child: AnimatedOpacity(
              opacity:
                  _latestValue != null && !_latestValue.isPlaying && !_dragging
                      ? 0.8
                      : 0.0,
              duration: Duration(milliseconds: 300),
              child: GestureDetector(
                onTap: () {
                  _playPause();
                },
                // child: Container(
                //   margin: EdgeInsets.only(bottom: 10, right: 10),
                //   decoration: BoxDecoration(
                //     boxShadow: <BoxShadow>[
                //       BoxShadow(color: Colors.black54, blurRadius: 20),
                //     ],
                //   ),
                //   child: Icon(
                //     Icons.play_arrow,
                //     size: 40.0,
                //     color: Colors.white,
                //   ),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildPlayPause(VideoPlayerController controller) {
    return GestureDetector(
      onTap: _playPause,
      child: Container(
        height: barHeight,
        color: Colors.transparent,
        margin: EdgeInsets.only(left: 8.0, right: 4.0),
        padding: EdgeInsets.only(
          left: 12.0,
          right: 12.0,
        ),
        child: Icon(
          controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPosition(BuildContext context) {
    // final position = _latestValue != null && _latestValue.position != null
    //     ? _latestValue.position
    //     : Duration.zero;
    // final duration = _latestValue != null && _latestValue.duration != null
    //     ? _latestValue.duration
    //     : Duration.zero;

    return Center(
      child: Text(
        '哈哈哈哈哈哈哈哈哈哈',
        style: TextStyle(fontSize: 12.0, color: Colors.white),
      ),
    );
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      _hideStuff = false;
      _displayTapped = true;
    });
  }

  Future<Null> _initialize() async {
    controller.addListener(_updateState);

    _updateState();

    if ((controller.value != null && controller.value.isPlaying) ||
        chewieController.autoPlay) {
      _startHideTimer();
    }

    if (chewieController.showControlsOnInitialize) {
      _initTimer = Timer(Duration(milliseconds: 200), () {
        setState(() {
          _hideStuff = false;
        });
      });
    }
  }

  void _onExpandCollapse() {
    setState(() {
      _hideStuff = true;

      chewieController.toggleFullScreen();
      _showAfterExpandCollapseTimer = Timer(Duration(milliseconds: 300), () {
        setState(() {
          _cancelAndRestartTimer();
        });
      });
    });
  }

  void _playPause() {
    bool isFinished = _latestValue.position >= _latestValue.duration;

    setState(() {
      if (controller.value.isPlaying) {
        _hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
      } else {
        _cancelAndRestartTimer();

        if (!controller.value.initialized) {
          controller.initialize().then((_) {
            controller.play();
          });
        } else {
          if (isFinished) {
            controller.seekTo(Duration(seconds: 0));
          }
          controller.play();
        }
      }
    });
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _hideStuff = true;
      });
    });
  }

  void _updateState() {
    setState(() {
      _latestValue = controller.value;
    });
  }

  Widget _buildProgressBar() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: MaterialVideoProgressBar(controller, onDragStart: () {
          setState(() {
            _dragging = true;
          });

          _hideTimer?.cancel();
        }, onDragEnd: () {
          setState(() {
            _dragging = false;
          });
          _startHideTimer();
        },
            colors: ChewieProgressColors(
              playedColor: Theme.of(context).primaryColor,
              handleColor: Colors.white,
              bufferedColor: Colors.white70,
              backgroundColor: Colors.white30,
            )),
      ),
    );
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }
}
