import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/Widgets/CustomDialog.dart';
import 'package:ciying/api/account/check_account.dart';
import 'package:ciying/api/msg/get_msg_channel.dart';
import 'package:ciying/common/AppConfig.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/accountManager.pbgrpc.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/page/Search/search_bar.dart';
import 'package:ciying/page/Search/search_cache.dart';
import 'package:ciying/page/Search/search_tags.dart';
import 'package:ciying/page/User/Login_out.dart';
import 'package:ciying/page/User/UserCache.dart';
import 'package:ciying/widgets/custom_app_bar.dart';
import 'package:ciying/widgets/SlideContainer.dart';
import 'package:ciying/page/User/UserDrawerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          backgroundColor: AppDesignCourseAppTheme.BackgroundColor,
          body: _SearchListBody(),
        ),
      );
}

class _SearchListBody extends StatefulWidget {
  @override
  _SearchListBodyState createState() => _SearchListBodyState();
}

class _SearchListBodyState extends State<_SearchListBody>
    with TickerProviderStateMixin {
  List<String> msgList = new List<String>();
  AnimationController animationController;

  double position = 0.0;
  double height = 0.0;
  bool _accountStatus = true;

  /// search ipunt focus
  FocusNode searchInputFieldNode = new FocusNode();
  //search TextField
  TextEditingController _searchEtController;
  UserInfo userInfo;

  @override
  void initState() {
    super.initState();
    _searchEtController = TextEditingController();
    _checkAccountStatus();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    searchInputFieldNode.addListener(() {
      if (this.mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _checkAccountStatus() async {
    CheckAccountIdStatusResponse checkAccountIdStatusResponse;
    checkAccountIdStatusResponse =
        await CheckAcountStatus.getAccountCoinByAccountIdRequest(null);
    if (checkAccountIdStatusResponse != null) {
      // 容错 账号服务不可用，用户继续使用
      if (this.mounted)
        setState(() {
          _accountStatus = true;
        });
    } else if (checkAccountIdStatusResponse.status != 0) {
      if (this.mounted)
        setState(() {
          _accountStatus = false;
        });
    } else {
      if (this.mounted)
        setState(() {
          _accountStatus = true;
        });
    }
  }

  _getMsgChannel() async {
    GetMsgChannelRequest getMsgChannelRequest = GetMsgChannelRequest();
    getMsgChannelRequest.accountId = "";
    GetMsgChannelResponse getMsgChannelResponse =
        await GetMsgChannel.getAccountCoinByAccountIdRequest(
            getMsgChannelRequest);
    if (getMsgChannelResponse.code != ResponseCode.SUCCESSFUL)
      setState(() {
        msgList = null;
      });
    else
      setState(() {
        msgList = getMsgChannelResponse.msg;
      });
  }

  double get maxSlideDistance => MediaQuery.of(context).size.width * 0.75;

  final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();

  void onSlide(double position) {
    setState(() => this.position = position);
  }

  @override
  Widget build(BuildContext context) {
    double widthBar = MediaQuery.of(context).size.width;
    if (!_accountStatus)
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return CustomDialog(
              title: '温馨提示',
              content: '账号异常，已封号',
              isCancel: false,
              outsideDismiss: true,
              confirmCallback: () {
                loginOut(context);
              },
            );
          });
    else
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
                      title: CommonConfig.ConfAppName,
                      // height: kToolbarHeight * (1 - position / 5),
                      tapDrawer: () {
                        _slideKey.currentState.openOrClose();
                      },
                      isSearch: true,
                    ),
                    if (msgList.length > 1)
                      new Container(
                        child: Text("消息提示：" + msgList[0].toString(),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red[800],
                            )),
                      ),
                    Expanded(
                        child: Stack(children: <Widget>[
                      new CustomScrollView(slivers: <Widget>[
                        new SliverToBoxAdapter(child: new getSearchBarUI()),
                        new SliverToBoxAdapter(child: new SearchTags()),
                        // new SliverToBoxAdapter(child: new SearchClass()),
                      ]),
                      // SearchClass(),
                    ]))
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
        // bottomNavigationBar: botNavBar,
      );
  }
}
