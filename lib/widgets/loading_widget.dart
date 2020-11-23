import 'package:ciying/util/hexColor.dart';
import 'package:flutter/material.dart';

Widget loadingWidget(BuildContext context, bool isError) {
  return Center(
      child: Column(children: <Widget>[
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
    ),
    Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Image.asset(
        'assets/images/alert.png',
      ),
    ),
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    ),
    Text(
      isError ? "服务器开小差啦,请稍后重试～" : "正在加载....",
      style: TextStyle(
          fontSize: 18,
          color: HexColor("#252C4E"),
          fontWeight: FontWeight.w500),
    ),
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
    ),
    if (!isError)
      Center(
        child: new CircularProgressIndicator(
            // 0~1的浮点数，用来表示进度多少;如果 value 为 null 或空，则显示一个动画，否则显示一个定值
            // value: 0.0,
            //背景颜色
            // backgroundColor: Colors.grey,
            //进度颜色
            valueColor: new AlwaysStoppedAnimation<Color>(
          HexColor("#252C4E"),
        )),
      ),
  ]));
}
