import 'package:ciying/Widgets/dialog.dart';
import 'package:ciying/Widgets/loading_widget.dart';
import 'package:ciying/api/search/search.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Search/search_list_view.dart';
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
          fixedColor: Colors.black,
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
    return CupertinoPageScaffold(
        child: Container(
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
            ])));
  }
}

class _ResourceListBody extends StatefulWidget {
  final String searchText;
  _ResourceListBody(this.searchText);
  @override
  __ResourceListBodyState createState() => __ResourceListBodyState();
}

class __ResourceListBodyState extends State<_ResourceListBody>
    with TickerProviderStateMixin {
  AnimationController animationController;

  bool _isLoading = true;
  bool _isError = false;
  // List<CacheResourceSection> _resourceSection =
  //     new List<CacheResourceSection>();
  List<ResourceSection> _resourceSection = new List<ResourceSection>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
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
    return Container(
      child: SlideStack(
        drawer: UserDrawerPage(),
        child: SlideContainer(
          key: _slideKey,
          child: Stack(
            children: <Widget>[
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  children: <Widget>[
                    CustomAppBar(
                      title: widget.searchText,
                      tapDrawer: () {
                        _slideKey.currentState.openOrClose();
                      },
                      isSearch: false,
                    ),
                    Expanded(
                      child: NestedScrollView(
                        controller: _scrollController,
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverPersistentHeader(
                              pinned: true,
                              floating: true,
                              delegate: ContestTabHeader(
                                getFilterBarUI(),
                              ),
                            ),
                          ];
                        },
                        body: Container(
                          color: Colors.white,
                          child: this._isLoading
                              ? loadingWidget(context, false)
                              : ListView.builder(
                                  itemCount: _resourceSection.length,
                                  padding: const EdgeInsets.only(top: 8),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final int count =
                                        _resourceSection.length > 10
                                            ? 10
                                            : _resourceSection.length;
                                    final Animation<double> animation =
                                        Tween<double>(begin: 0.0, end: 1.0)
                                            .animate(CurvedAnimation(
                                                parent: animationController,
                                                curve: Interval(
                                                    (1 / count) * index, 1.0,
                                                    curve:
                                                        Curves.fastOutSlowIn)));
                                    animationController.forward();
                                    return SearchlListView(
                                      this._resourceSection[index],
                                      widget.searchText,
                                      animationController,
                                      animation,
                                      // callback: () {},
                                      null,
                                    );
                                  },
                                ),
                        ),
                        // body: SearchGrid(_resourceSection, widget.searchText),
                      ),
                    )
                  ],
                ),
              ),
            ],
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

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.search_outlined,
                    size: 20,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getFilterBarUI() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, -2),
                    blurRadius: 8.0),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xFFFFFFFF),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '精准搜索/自定义素材,点击右下角获取联系...',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 18,
                        color: Color(0xFF4A6572),
                      ),
                    ),
                  ),
                ),
                // Material(
                //   color: Colors.transparent,
                //   child: InkWell(
                //     focusColor: Colors.transparent,
                //     highlightColor: Colors.transparent,
                //     hoverColor: Colors.transparent,
                //     splashColor: Colors.grey.withOpacity(0.1),
                //     borderRadius: const BorderRadius.all(
                //       Radius.circular(4.0),
                //     ),
                //     onTap: () {
                //       FocusScope.of(context).requestFocus(FocusNode());
                //       // Navigator.push<dynamic>(
                //       //   context,
                //       //   MaterialPageRoute<dynamic>(
                //       //       builder: (BuildContext context) => FiltersScreen(),
                //       //       fullscreenDialog: true),
                //       // );
                //     },
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 8),
                //       child: Row(
                //         children: <Widget>[
                //           Text(
                //             '筛选',
                //             style: TextStyle(
                //               fontWeight: FontWeight.w100,
                //               fontSize: 16,
                //               color: Color(0xFFF2F2F2),
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Icon(
                //               Icons.sort,
                //               color: Color(0xFFF2F2F2),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
