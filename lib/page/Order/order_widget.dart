import 'dart:ui';

import 'package:ciying/models/Order.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class OrderWidget extends StatelessWidget {

  final Order _order;
  final double _gridSize;
  OrderWidget(this._order, this._gridSize);

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
      new ClipOval(child:
        CachedNetworkImage(
            width:50,
            height: 50,
            imageUrl: this._order.resourceSection.resourceAddress,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      new Padding(padding: EdgeInsets.symmetric(horizontal: 5), child:
        new Text(this._order.resourceSection.sourceName.toString(), style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold))
      ),
      // new Text(":", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
      new Flexible(flex: 2, child:
        new Padding(padding: EdgeInsets.symmetric(horizontal: 5), child:
          new Text(this._order.resourceSection.source, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold))
        )
      ),
      new Flexible(flex: 1, child:
      new Text("${this._order.id.toStringAsFixed(2)}", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold))
      ),
      FlatButton(
    // onPressed: () {
    //   _checkPermission().then((hasGranted) {
    //     setState(() {
    //       _permissionReady = hasGranted;
    //     });
    //   });
    // },
    child: Text(
      '等待中',
      style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 14.0),
     )
    ),
    SizedBox(
        //限制进度条的高度
        height: 25.0,
        //限制进度条的宽度
        width: 25,
        child: new CircularProgressIndicator(
          //0~1的浮点数，用来表示进度多少;如果 value 为 null 或空，则显示一个动画，否则显示一个定值
            value: 0.0,
            //背景颜色
            backgroundColor: Colors.grey,
            //进度颜色
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue)),
      ),
    ]);
  }

}
