import 'package:ciying/Utils/color.dart';
import 'package:ciying/common/AppConfig.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/widgets/custom_app_bar.dart';
import 'package:ciying/widgets/SlideContainer.dart';
import 'package:ciying/page/User/UserDrawerPage.dart';
import 'package:flutter/material.dart';

class FavoriteTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: CommonConfig.IsdebugShowCheckedModeBanner,
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
    double statusBarHeight;
    // Platform.isIOS 刘海屏。。。。。
    // print(MediaQuery.of(context).padding.top)
    if (MediaQuery.of(context).padding.top == null ||
        MediaQuery.of(context).padding.top == 0) {
      statusBarHeight = MediaQuery.of(context).padding.top - 40;
    } else {
      statusBarHeight = MediaQuery.of(context).padding.top - 15;
    }
    height = MediaQuery.of(context).size.height - statusBarHeight;
    double widthBar = MediaQuery.of(context).size.width;
    return GestureDetector(
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
                  title: "词影_收藏夹",
                  height: kToolbarHeight * (1 - position / 5),
                  tapDrawer: () {
                    _slideKey.currentState.openOrClose();
                  },
                  isSearch: false,
                ),
                favoritesPage(),
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
    );
  }
}

class favoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 3;
    var columnCount = isLandscape ? 3 : 2;
    double _gridSize = MediaQuery.of(context).size.height;
    return Container(
      width: 800,
      height: _gridSize - 100,
      margin: EdgeInsets.all(3),
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: columnCount,
        children: List.generate(12, (index) {
          return _TimelineDelivery();
        }),
      ),
    );
  }
}

class _TimelineDelivery extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final Color color;
  final Color backgroundColor;

  const _TimelineDelivery(
      {Key key,
      this.cornerRadius = 0,
      this.color,
      this.backgroundColor,
      this.width = 100,
      this.height = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // width: width,
      // height: height,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(cornerRadius),
      //   color: Colors.grey,
      // ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      color: Colors.white10,
      elevation: 5,
      margin: EdgeInsets.all(3),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: randomColor(),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                  height: 16,
                  child: new Text(
                    "这是一个台词",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14),
                  ),
                  margin: EdgeInsets.only(top: 12, left: 10, right: 70)),
              Container(
                height: 18,
                child: new Text(
                  "数量",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
                margin: EdgeInsets.only(top: 40, left: 10, right: 30),
              ),
              Container(
                height: 18,
                child: new Text(
                  "数量",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
                margin:
                    EdgeInsets.only(top: 72, left: 10, right: 60, bottom: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
