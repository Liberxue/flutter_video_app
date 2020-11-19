import 'dart:ui';

import 'package:ciying/util/hexColor.dart';
import 'package:ciying/util/store.dart';
import 'package:flutter/material.dart';

class _MenuInfo {
  final String title;
  final IconData icon;

  _MenuInfo({this.title, this.icon});
}

final List<_MenuInfo> menus = [
  _MenuInfo(title: '收藏列表', icon: Icons.photo_album),
  _MenuInfo(title: '隐私设置', icon: Icons.photo_album),
  _MenuInfo(title: '关于我们', icon: Icons.photo_album),
  _MenuInfo(title: '退出登录', icon: Icons.photo_album),
];

class _UserInfo {
  String token;
  String avatarImage;
  String phoneNumber;
  String coin;
  String accountLevel;
  _UserInfo(
      {this.token,
      this.avatarImage,
      this.phoneNumber,
      this.coin,
      this.accountLevel});
}

class UserDrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserDrawerPageState();
  }
}

class _UserDrawerPageState extends State<UserDrawerPage> {
  _UserInfo _user = new _UserInfo();

  @override
  void initState() {
    super.initState();
    _onLoadUserCache();
  }

  _onLoadUserCache() async {
    _user.token = await Cache.getCache("Token");
    _user.avatarImage = await Cache.getCache("AvatarImage");
    _user.phoneNumber = await Cache.getCache("PhoneNumber");
    _user.coin = await Cache.getCache("Coin");
    _user.accountLevel = await Cache.getCache("AccountLevel");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     backgroundBlendMode: BlendMode.plus,
      //     image: DecorationImage(
      //         image: AssetImage('assets/images/logo.png'),
      //         fit: BoxFit.fill),
      // color: Colors.white),

      color: HexColor("#1C284E"), //
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: new Container(
          padding: EdgeInsets.only(top: 80.0, left: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // 第三方登录显示用户头像？
                  // Container(
                  //   width: 50,
                  //   height: 20,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: NetworkImage(_user.avatarImage))),
                  // ),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "用户_" + _user.phoneNumber,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.white),
                      )),
                ],
              ),
              // new Container(
              //     // margin: EdgeInsets.only(top: _gridSize*0.1),
              //     height: 40,
              //     child: new Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         children: <Widget>[
              //           new Container(
              //             width: 40,
              //             color: Colors.transparent,
              //             child: Text(' ', style: TextStyle(fontSize: 100)),
              //           ),
              //           new Container(
              //             width: 50,
              //             height: 30,
              //             child: Center(
              //               child: Text("充值",
              //                   style: TextStyle(
              //                       color: Color.fromRGBO(102, 51, 0, 0.9),
              //                       fontSize: 14)),
              //             ),
              //             decoration: BoxDecoration(
              //                 color: Color.fromRGBO(255, 178, 102, 0.9),
              //                 borderRadius: BorderRadius.circular(16),
              //                 boxShadow: [
              //                   BoxShadow(color: Colors.blueGrey, blurRadius: 5)
              //                 ]),
              //           ),
              //         ]),
              //         ),
              Expanded(
                child: ListView.builder(
                    itemCount: menus.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print("Container clicked");
                        },
                        child: Ink(
                          height: 60.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Icon(
                                  menus[index].icon,
                                  color: Colors.white,
                                ),
                              ),
                              Center(
                                child: Text(
                                  menus[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                height: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "当前积分",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          _user.coin,
                          style: TextStyle(
                            fontSize: 26,
                            color: Color.fromRGBO(255, 178, 102, 0.9),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 250,
                height: 40,
                child: Center(
                  child: Text("试用模式,无法充值,请联系客服",
                      style: TextStyle(
                          color: Color.fromRGBO(102, 51, 0, 0.9),
                          fontSize: 14)),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 178, 102, 0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.blueGrey, blurRadius: 5)
                    ]),
              ),
            ],
          ),
          // decoration: new BoxDecoration(color: Colors.white.withOpacity(0.25)),
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0)),
        ),
      ),
    );
  }
}
