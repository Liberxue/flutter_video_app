import 'dart:ui';

import 'package:ciying/Utils/store.dart';
import 'package:ciying/api/coin/get_coin.dart';
import 'package:ciying/grpc/proto/accountManager.pb.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/page/Favorites/favorite_timeline.dart';
import 'package:ciying/page/User/Login.dart';
import 'package:ciying/page/User/Login_out.dart';
import 'package:ciying/page/User/UserCache.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/widgets/CustomDialog.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

class _MenuInfo {
  final String title;
  final IconData icon;

  _MenuInfo({this.title, this.icon});
}

final List<_MenuInfo> menus = [
  // _MenuInfo(title: '隐私设置', icon: Icons.lock),
  // _MenuInfo(title: '关于我们', icon: Icons.center_focus_strong),
  _MenuInfo(title: '退出登录', icon: Icons.logout),
];

class _UserInfo {
  final String title;
  final bool isButton;

  _UserInfo({this.title, this.isButton});
}

final List<_UserInfo> user = [
  _UserInfo(title: '积分', isButton: true),
  // _UserInfo(title: '收藏夹', isButton: false),
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
  Int64 _coin = Int64(0);

  UserInfo userInfo;
  @override
  void initState() {
    super.initState();
    _getCoin();
    _getLoginState();
  }

  _getLoginState() async {
    var userInfo = await loadUserCache();
    setState(() {
      this.userInfo = userInfo;
      this._isLogin = true;
      this._isLoading = false;
    });
  }

  _getCoin() async {
    GetAccountCoinByAccountIdRequest getAccountCoinByAccountIdRequest =
        new GetAccountCoinByAccountIdRequest();
    var accountId = await Cache.getUserId();
    getAccountCoinByAccountIdRequest.accountId = accountId.toString();
    GetAccountCoinByAccountIdResponse getAccountCoinByAccountIdResponse;
    getAccountCoinByAccountIdResponse =
        await GetAcountCoin.getAccountCoinByAccountIdRequest(
            getAccountCoinByAccountIdRequest);
    if (getAccountCoinByAccountIdResponse == null) {
      return;
    }
    if (getAccountCoinByAccountIdResponse.code == ResponseCode.SUCCESSFUL) {
      setState(() {
        _coin = getAccountCoinByAccountIdResponse.coin;
      });
      return;
    }
    setState(() {
      _coin = Int64(0);
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _getCoin();
      },
      child: Container(
        // decoration: BoxDecoration(
        //     backgroundBlendMode: BlendMode.plus,
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/logo.png'),
        //         fit: BoxFit.fill),
        // color: Colors.white),

        color: HexColor("#F6F6F6"), //
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 120.0, left: 20),
                        child: Container(
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 110.0, left: 20),
                        child: Text(
                          userInfo != null
                              ? "       " + userInfo.phoneNumber
                              : "游客模式",
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF17262A),
                          ),
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
                                      userInfo != null ? _coin.toString() : "0",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF213333))),
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
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                              new Container(
                                width: 20,
                                color: Colors.transparent,
                              ),
                              if (user[index].title == "积分")
                                new Container(
                                  width: 85,
                                  child: new Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: new RaisedButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (_) {
                                              return Center(
                                                child: Card(
                                                  child: Container(
                                                    width: 300,
                                                    height: 300,
                                                    child: Column(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 10.0,
                                                        ),
                                                        Text("请截图二维码",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    16.0)),
                                                        SizedBox(
                                                          height: 10.0,
                                                        ),
                                                        Image.asset(
                                                          "assets/images/support.png",
                                                          height: 200,
                                                          width: 200,
                                                        ),
                                                        SizedBox(height: 10.0),
                                                        Text("请添加微信，联系客服充值",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    14.0)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: new Text("充值",
                                          style: TextStyle(
                                              color: Color(0xFFEDF0F2),
                                              fontSize: 12)),
                                      color: HexColor("#DF9833"),
                                    ),
                                  ),
                                ),
                              if (user[index].title != "积分")
                                new Container(
                                  width: 120,
                                  color: Colors.black,
                                ),
                              if (user[index].title != "积分")
                                new Container(
                                  width: 100,
                                  height: 30,
                                  color: Colors.transparent,
                                  child: Text(
                                    '100',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
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
                          if (index == 0) {
                            userInfo != null
                                ? showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) {
                                      return CustomDialog(
                                        title: '温馨提示',
                                        content: '是否确认退出登陆',
                                        isCancel: true,
                                        outsideDismiss: true,
                                        confirmCallback: () {
                                          loginOut(context);
                                        },
                                      );
                                    })
                                : loginOut(context);
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
                                  userInfo != null
                                      ? menus[index].icon
                                      : Icons.cloud_circle_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              Center(
                                child: Text(
                                  userInfo != null
                                      ? menus[index].title
                                      : "立即登陆",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
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
      ),
      // decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)), //透明度
    );
  }
}
