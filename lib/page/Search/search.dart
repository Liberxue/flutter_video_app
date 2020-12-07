import 'package:ciying/common/AppConfig.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/page/Search/search_bar.dart';
import 'package:ciying/page/Search/search_tags.dart';
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
  double position = 0.0;
  double height = 0.0;

  /// search ipunt focus
  FocusNode searchInputFieldNode = new FocusNode();
  //search TextField
  TextEditingController _searchEtController;

  @override
  void initState() {
    super.initState();
    _searchEtController = TextEditingController();
    searchInputFieldNode.addListener(() {
      if (this.mounted) setState(() {});
    });
  }

  double get maxSlideDistance => MediaQuery.of(context).size.width * 0.75;

  final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();

  void onSlide(double position) {
    setState(() => this.position = position);
  }

  @override
  Widget build(BuildContext context) {
    // double statusBarHeight;
    // Platform.isIOS 刘海屏。。。。。
    // print(MediaQuery.of(context).padding.top)
    double widthBar = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  Expanded(
                      child: Stack(children: <Widget>[
                    new CustomScrollView(slivers: <Widget>[
                      new SliverToBoxAdapter(child: new getSearchBarUI()),
                    ]),
                    // getSearchBarUI(),
                    SearchTags(),
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
