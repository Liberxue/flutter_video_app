import 'dart:async';

import 'package:ciying/Utils/hexColor.dart';
import 'package:flutter/material.dart';

Widget loadingWidget(BuildContext context, bool isError) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Image.asset(
            'assets/images/logo.gif',
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          isError ? "服务器开小差啦,请稍后重试～" : "正在加载....",
          style: TextStyle(
              fontSize: 18,
              color: HexColor("#252C4E"),
              fontWeight: FontWeight.w500),
        )
      ]));
}
