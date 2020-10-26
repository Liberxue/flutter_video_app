import 'dart:math';

import 'package:CiYing/util/size_helper.dart';
import 'package:flutter/material.dart';

class DisableScreenshotsWatarmark extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final String text;
  final TextStyle textStyle;

  const DisableScreenshotsWatarmark({
    Key key,
    @required this.rowCount,
    @required this.columnCount,
    @required this.text,
    @required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return IgnorePointer(
      child: Container(
          child: Column(
            children: creatColumnWidgets(context),
          )),
          
    );
    
  }

  List<Widget> creatRowWdiges() {
    List<Widget> list = [];
    for (var i = 0; i < rowCount; i++) {
      final widget = Expanded(
          child: Center(
            widthFactor: 10,
              child: Transform.rotate(
                  angle: pi / 10, child: Text(text, style: textStyle))));
      list.add(widget);
    }
    return list;
  }

  List<Widget> creatColumnWidgets(BuildContext context) {
    List<Widget> list = [];
    for (var i = 0; i < columnCount; i++) {
      final widget = Expanded(
          child: Row(
            children: creatRowWdiges(),
          ));
          // Stack(
          //         alignment: AlignmentDirectional.bottomStart,
          //         children: <Widget>[
          //           Container(
          //             child: Image.asset(
          //               "assets/images/logo.png",
          //               width: (displayWidth(context) - 50) / 2,
          //               height: (displayHeight(context) - 50) / 1.5,
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //           Container(
          //             width: (displayWidth(context) - 50) / 2,
          //             height: (displayHeight(context) - 50) / 1.5*0.9,
          //             child: Text("1"),
          //             decoration: BoxDecoration(color: Color(0x90000000)),
          //           )
          //         ],
          //       );
      list.add(widget);
    }
    return list;
  }
}


/**
 * 水印工具类 单例 instance
 * 使用方式：
 *
 * 获取实例: WatarMarkInstance instance = WatarMarkInstance();
 * 添加水印: instance.addWatermark(context, "320321199708134818");
 * 删除水印: instance.removeWatermark();
 *
 */
class WatarMarkInstance {

  static WatarMarkInstance _instance;
  factory WatarMarkInstance() {
    if (_instance == null) {
      _instance = WatarMarkInstance.private();
    }
    return _instance;
  }

  WatarMarkInstance.private();

  OverlayEntry _overlayEntry;

  void addWatermark(BuildContext context, String watermark,
      {int rowCount = 2, int columnCount = 8, TextStyle textStyle}) async {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
    }
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
        builder: (context) => DisableScreenshotsWatarmark(
          rowCount: rowCount,
          columnCount: columnCount,
          text: watermark,
          textStyle: textStyle ??
              const TextStyle(
                  color: Colors.yellow,
                  fontSize: 18,
                  decoration: TextDecoration.none),
        ));
    overlayState.insert(_overlayEntry);
    // return await _methodChannel.invokeMethod<void>("addWatermark", ['我是水印']);
  }


  void removeWatermark() async {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }
}
