import 'package:flutter/material.dart';
import 'package:ciying/page/extentions.dart';
import 'package:flutter/rendering.dart';

Widget favoritesIcon(
  IconData icon, {
  Color color = Colors.white,
  double size = 12,
  // double padding = 20,
  bool isOutLine = false,
  Function onPressed,
}) {
  return Container(
    // height: 31,
    // width: 10,
    // padding: EdgeInsets.all(padding),
    // margin: EdgeInsets.all(padding),
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.white,
          style: isOutLine ? BorderStyle.solid : BorderStyle.none),
      borderRadius: BorderRadius.all(Radius.circular(13)),
      color: isOutLine ? Colors.transparent : Colors.transparent,
      boxShadow: <BoxShadow>[
        // BoxShadow(
        //     // color: Color.fromRGBO(0, 0, 0,0.1),
        //     blurRadius: 1,
        //     spreadRadius: 1,
        //     offset: Offset(1, 1)),
      ],
    ),
    child: Icon(icon, color: color, size: size),
  ).ripple(() {
    if (onPressed != null) {
      onPressed();
    }
  }, borderRadius: BorderRadius.all(Radius.circular(13)));
}
