import 'package:flutter/material.dart';
import 'package:CiYing/page/extentions.dart';
import 'package:flutter/rendering.dart';


Widget likeIcon(
    IconData icon, {
    Color color =  Colors.white,
    double size = 14,
    double padding = 15,
    bool isOutLine = false,
    Function onPressed,
  }) {
    return Container(
      height: 35,
      width: 35,
      // padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent :  Colors.transparent,
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