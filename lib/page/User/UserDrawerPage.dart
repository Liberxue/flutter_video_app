import 'dart:ui';

import 'package:ciying/page/Favorites/favorite_timeline.dart';
import 'package:ciying/page/User/Login_out.dart';
import 'package:ciying/page/User/UserCache.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/widgets/CustomDialog.dart';
import 'package:flutter/material.dart';

class _MenuInfo {
  final String title;
  final IconData icon;

  _MenuInfo({this.title, this.icon});
}

final List<_MenuInfo> menus = [
  _MenuInfo(title: '隐私设置', icon: Icons.lock),
  _MenuInfo(title: '关于我们', icon: Icons.center_focus_strong),
  _MenuInfo(title: '退出登录', icon: Icons.logout),
];

class _UserInfo {
  final String title;
  final bool isButton;

  _UserInfo({this.title, this.isButton});
}

final List<_UserInfo> user = [
  _UserInfo(title: '积分', isButton: true),
  _UserInfo(title: '收藏夹', isButton: false),
  // _UserInfo(title: '下载', isButton: false),
];

class UserDrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserDrawerPageState();
  }
}

class _UserDrawerPageState extends State<UserDrawerPage> {
  bool _isLogin = false;
  bool _isLoading = true;
  UserInfo userInfo;
  @override
  void initState() {
    super.initState();
    _getLoginState();
  }

  _getLoginState() async {
    var userInfo = await LoadUserCache();
    setState(() {
      this.userInfo = userInfo;
      this._isLogin = true;
      this._isLoading = false;
    });
    if (userInfo == null && _isLogin) {
      loginOut(context);
    }
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

      color: HexColor("#283362"), //
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // 第三方登录显示用户头像？
                    // Padding(
                    //   padding: EdgeInsets.only(top: 120.0, left: 20),
                    //   child: Container(
                    //     width: 300,
                    //     height: 80,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: AssetImage('assets/images/alert.png'),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 140.0, left: 20),
                      child: Text(
                        !_isLoading || userInfo != null
                            ? "       " + userInfo.phoneNumber
                            : "未知",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 180, left: 10),
              child: ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavoriteTimeline(),
                                  maintainState: false));
                        }
                      },
                      child: Ink(
                        height: 50.0,
                        width: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            if (user[index].title == "积分")
                              new Container(
                                padding: EdgeInsets.only(left: 10.0),
                                height: 30,
                                color: Colors.transparent,
                                child: Text(
                                    !_isLoading || userInfo != null
                                        ? userInfo.coin
                                        : "0",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: HexColor("#CFD0D1"))),
                              ),
                            new Container(
                              width: 10,
                              color: Colors.transparent,
                            ),
                            new Container(
                              width: 80,
                              height: 33,
                              color: Colors.transparent,
                              child: Text(
                                user[index].title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            new Container(
                              width: 20,
                              color: Colors.transparent,
                            ),
                            if (user[index].title == "积分")
                              new Container(
                                width: 60,
                                child: new Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: new RaisedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (_) {
                                            return CustomDialog(
                                              title: '温馨提示',
                                              content: '公测版本暂不支持充值',
                                              isCancel: false,
                                              confirmContent: "知道啦",
                                              // cancelColor: Colors.green[400],
                                              // confirmColor: Colors.red[400],
                                              outsideDismiss: true,
                                              // confirmCallback: () {
                                              //   loginOut(context);
                                              // },
                                            );
                                          });
                                    },
                                    child: new Text("充值",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14)),
                                    color: HexColor("#DF9833"),
                                  ),
                                ),
                              ),
                            if (user[index].title != "积分")
                              new Container(
                                width: 120,
                                color: Colors.transparent,
                              ),
                            if (user[index].title != "积分")
                              new Container(
                                width: 100,
                                height: 30,
                                color: Colors.transparent,
                                child: Text(
                                  '100',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.only(top: 320, left: 20),
              child: ListView.builder(
                  itemCount: menus.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (index == 2) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) {
                                return CustomDialog(
                                  title: '温馨提示',
                                  content: '是否确认退出登陆',
                                  isCancel: true,
                                  // cancelColor: Colors.green[400],
                                  // confirmColor: Colors.red[400],
                                  outsideDismiss: true,
                                  confirmCallback: () {
                                    loginOut(context);
                                  },
                                );
                              });
                        }
                      },
                      child: Ink(
                        height: 60.0,
                        width: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Icon(
                                menus[index].icon,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                menus[index].title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      // decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)), //透明度
    );
  }
}
