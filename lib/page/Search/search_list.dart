import 'package:ciying/Widgets/dialog.dart';
import 'package:ciying/api/search/search.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Search/search_grid.dart';
import 'package:ciying/widgets/custom_app_bar.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/widgets/SlideContainer.dart';
import 'package:ciying/page/User/UserDrawerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  final String searchText;
  SearchList(this.searchText);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> _barItem = [
    BottomNavigationBarItem(
        icon: Icon(Icons.search_sharp), title: Text('聚合搜索')),
    BottomNavigationBarItem(icon: Icon(Icons.cut_sharp), title: Text('定制化搜索')),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor("#fff"),
        body: getList(widget.searchText, this._selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              this._selectedIndex = index;
            });
          },
          currentIndex: this._selectedIndex,
          items: _barItem,
          fixedColor: Colors.blue[600],
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  getList(String search, int selectedIndex) {
    if (selectedIndex == 0) {
      return _ResourceListBody(search);
    } else if (selectedIndex == 1) {
      return VipCustomPageContent();
    } else {}
  }
  //   List<Widget> _pageList = [
  //   _ResourceListBody(search),
  //   // NewsPage(),
  // ];
}

// 定制化。。。。。
class VipCustomPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/vipCustom.png',
              // fit: ,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "请在企业微信-联系我们",
            style: TextStyle(
                fontSize: 18,
                color: HexColor("#252C4E"),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/support.png',
              height: 200,
            ),
          ),
        ]));
  }
}

class _ResourceListBody extends StatefulWidget {
  final String searchText;
  _ResourceListBody(this.searchText);
  @override
  __ResourceListBodyState createState() => __ResourceListBodyState();
}

class __ResourceListBodyState extends State<_ResourceListBody> {
  bool _isLoading = true;
  bool _isError = false;
  // List<CacheResourceSection> _resourceSection =
  //     new List<CacheResourceSection>();
  List<ResourceSection> _resourceSection = new List<ResourceSection>();

  @override
  void initState() {
    super.initState();
    _performSearch();
  }

  void _performSearch() async {
    SearchRequest searchRequest = SearchRequest();
    searchRequest.text = widget.searchText;
    searchRequest.limit = 32;
    searchRequest.offset = 0;
    SearchResponse searchResponse =
        await Search.searchAPIRequest(searchRequest);
    // var resourceSection =
    //     await CacheSearch().cacheSearchBySearchText(searchRequest);
    if (searchResponse == null) {
      setState(() {
        _isError = true;
      });
      dialogShow("请求超时，请检查网络");
    }
    if (searchResponse.code != ResponseCode.SUCCESSFUL) {
      dialogShow("搜索结果不存在");
      setState(() {
        _isError = true;
      });
    }
    if (searchResponse.resourceSection == null) {
      dialogShow("请求失败，请稍后再试");
      setState(() {
        _isError = true;
      });
    } else
      setState(() {
        _resourceSection.addAll(searchResponse.resourceSection);
        _isLoading = false;
        _isError = false;
      });
  }

  double position = 0.0;
  double height = 0.0;

  double get maxSlideDistance => MediaQuery.of(context).size.width * 0.9;

  final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();

  void onSlide(double position) {
    setState(() => this.position = position);
  }

  @override
  Widget build(BuildContext context) {
    // var childrenHeader = <Widget>[
    //   CustomAppBar(
    //     title: widget.searchText,
    //     tapDrawer: () {
    //       _slideKey.currentState.openOrClose();
    //     },
    //   ),
    //   SearchGrid(_resourceSection, widget.searchText, _isLoading),
    // ];
    return Container(
      child: SlideStack(
        drawer: UserDrawerPage(),
        child: SlideContainer(
          key: _slideKey,
          child: Container(
            padding: const EdgeInsets.only(top: 6, left: 5, right: 5),
            color: Colors.white,
            // child: Column(
            //   // children: <Widget>[
            //   //   CustomAppBar(
            //   //     title: widget.searchText,
            //   //     // height: kToolbarHeight * (1 - position / 5),
            //   //     tapDrawer: () {
            //   //       _slideKey.currentState.openOrClose();
            //   //     },
            //   //     isSearch: false,
            //   //   ),
            //   //   Expanded(
            //   //       child: Stack(children: <Widget>[
            //   //     new CustomScrollView(slivers: <Widget>[
            //   //       new SliverToBoxAdapter(
            //   //           child: new SearchGrid(
            //   //               _resourceSection, widget.searchText, _isLoading)),
            //   //     ]),
            //   //     // getSearchBarUI(),
            //   //     // SearchTags(),
            //   //   ]))
            //   // ],
            // ),
            child: Wrap(
              spacing: 1.0, // 主轴(水平)方向间距
              runSpacing: 4.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                CustomAppBar(
                  title: widget.searchText,
                  tapDrawer: () {
                    _slideKey.currentState.openOrClose();
                  },
                  isSearch: false,
                ),
                new SearchGrid(_resourceSection, widget.searchText),
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

  @override
  void dispose() {
    super.dispose();
  }
}
