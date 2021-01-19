import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/Utils/store.dart';
import 'package:ciying/Widgets/SlideContainer.dart';
import 'package:ciying/Widgets/custom_app_bar.dart';
import 'package:ciying/api/coin/get_coin.dart';
import 'package:ciying/common/AppConfig.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/accountManager.pb.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/page/Speech/text_bar.dart';
import 'package:ciying/page/User/UserCache.dart';
import 'package:ciying/page/User/UserDrawerPage.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpeechPage extends StatefulWidget {
  @override
  _SpeechPageState createState() => _SpeechPageState();
}

class _SpeechPageState extends State<SpeechPage> with TickerProviderStateMixin {
  double position = 0.0;
  double height = 0.0;

  double get maxSlideDistance => MediaQuery.of(context).size.width * 0.9;

  final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();

  void onSlide(double position) {
    setState(() => this.position = position);
  }

  final double infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  Int64 _coin = Int64(0);
  bool _isLogin = false;
  bool _isDownload = false;
  bool _isLoading = true;
  UserInfo userInfo;

  /// search ipunt focus
  FocusNode searchInputFieldNode = new FocusNode();
  //search TextField
  TextEditingController _searchEtController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    _getCoin();

    _searchEtController = TextEditingController();

    searchInputFieldNode.addListener(() {
      if (this.mounted) setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    // FlutterDownloader.d
    _searchEtController.removeListener(() {});
    searchInputFieldNode.dispose();
    animationController.dispose();
    super.dispose();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
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
    if (getAccountCoinByAccountIdResponse != null) {
      if (getAccountCoinByAccountIdResponse.code == ResponseCode.SUCCESSFUL) {
        if (mounted) {
          setState(() {
            _coin = getAccountCoinByAccountIdResponse.coin;
          });
        }
        return;
      }
      if (mounted) {
        setState(() {
          _coin = Int64(0);
        });
      }
      return;
    }
    if (mounted) {
      setState(() {
        _coin = Int64(0);
      });
    }
    return;
  }

  _getLoginState() async {
    var userInfo = await loadUserCache();
    if (userInfo == null || _isLogin) {
      this._isLogin = false;
      this._isLoading = false;
    } else {
      setState(() {
        this.userInfo = userInfo;
        this._isLogin = true;
        this._isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthBar = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          //隐藏键盘
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          //输入框失去焦点
          searchInputFieldNode.unfocus();
        },
        child: SlideStack(
          drawer: new UserDrawerPage(),
          child: SlideContainer(
            key: _slideKey,
            child: Container(
              width: widthBar,
              color: AppDesignCourseAppTheme.BackgroundColor,
              child: Column(
                children: <Widget>[
                  CustomAppBar(
                    title: CommonConfig.ConfAppName + "_美文配音",
                    tapDrawer: () {
                      _slideKey.currentState.openOrClose();
                    },
                    isSearch: false,
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        // Positioned(
                        //   top: 15,
                        //   left: 15,
                        //   right: 15,
                        //   child: Container(
                        //     child: Text(" 使用技巧:  增加空格或标点符号，调整断句和停顿",
                        //         maxLines: 1,
                        //         textAlign: TextAlign.left,
                        //         overflow: TextOverflow.ellipsis,
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.w300,
                        //           fontSize: 14,
                        //           color: HexColor("#2B2F4F"),
                        //         )),
                        //   ),
                        // ),
                        Container(
                          child: Text(" 使用技巧:  增加空格或标点符号，调整断句和停顿",
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: HexColor("#2B2F4F").withOpacity(0.75),
                              )),
                        ),
                        TextInputBarUI(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            slideDirection: SlideDirection.left,
            onSlide: onSlide,
            drawerSize: maxSlideDistance,
            transform:
                Matrix4.translationValues(0.0, height * position / 150, 0.0),
          ),
        ),
      ),
    );
  }
}
