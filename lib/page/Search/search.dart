import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/common/AppConfig.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/page/Search/search_bar.dart';
import 'package:ciying/page/Search/search_tags.dart';
import 'package:ciying/page/User/UserCache.dart';
import 'package:ciying/page/Speech/speech.dart';
import 'package:ciying/widgets/custom_app_bar.dart';
import 'package:ciying/widgets/SlideContainer.dart';
import 'package:ciying/page/User/UserDrawerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  @override
  State createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> _barItem = [
    BottomNavigationBarItem(icon: Icon(Icons.search_sharp), title: Text('搜索')),
    BottomNavigationBarItem(icon: Icon(Icons.audiotrack), title: Text('配音')),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: CommonConfig.IsdebugShowCheckedModeBanner,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: getList(this._selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            if (this.mounted) {
              setState(() {
                this._selectedIndex = index;
              });
            }
          },
          currentIndex: this._selectedIndex,
          items: _barItem,
          fixedColor: HexColor("#252C4E"),
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  getList(int selectedIndex) {
    if (selectedIndex == 0) {
      return new SearchPageContent();
    } else if (selectedIndex == 1) {
      return new SpeechPage();
    } else {}
  }
}

class SearchPageContent extends StatefulWidget {
  @override
  _SearchPageContentState createState() => new _SearchPageContentState();
}

class _SearchPageContentState extends State<SearchPageContent>
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
    // _checkAccountStatus();
    // _getMsgChannel();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    searchInputFieldNode.addListener(() {
      if (this.mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    searchInputFieldNode.dispose();
    animationController.dispose();
    _searchEtController.dispose();
    super.dispose();
  }

  // _checkAccountStatus() async {
  //   CheckAccountIdStatusResponse checkAccountIdStatusResponse;
  //   checkAccountIdStatusResponse =
  //       await CheckAcountStatus.getAccountCoinByAccountIdRequest(null);
  //   if (checkAccountIdStatusResponse != null) {
  //     // 容错 账号服务不可用，用户继续使用
  //     if (this.mounted)
  //       setState(() {
  //         _accountStatus = true;
  //       });
  //   }
  // }

  // _getMsgChannel() async {
  //   GetMsgChannelRequest getMsgChannelRequest = GetMsgChannelRequest();
  //   getMsgChannelRequest.accountId = "";
  //   GetMsgChannelResponse getMsgChannelResponse =
  //       await GetMsgChannel.getAccountCoinByAccountIdRequest(
  //           getMsgChannelRequest);
  //   if (getMsgChannelResponse == null)
  //     setState(() {
  //       msgList = null;
  //     });
  //   else if (getMsgChannelResponse.code != ResponseCode.SUCCESSFUL) {
  //     setState(() {
  //       msgList = getMsgChannelResponse.msg;
  //     });
  //   }
  // }

  double get maxSlideDistance => MediaQuery.of(context).size.width * 0.75;

  final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();

  void onSlide(double position) {
    if (this.mounted) {
      setState(() => this.position = position);
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
                            fontSize: 14,
                            color: Colors.red[800],
                          )),
                    ),
                  Expanded(
                      child: Stack(children: <Widget>[
                    new CustomScrollView(slivers: <Widget>[
                      new SliverToBoxAdapter(child: new getSearchBarUI()),
                      new SliverToBoxAdapter(child: new SearchTags()),
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
