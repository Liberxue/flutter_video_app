import 'package:ciying/Widgets/dialog.dart';
import 'package:ciying/Widgets/loading_widget.dart';
import 'package:ciying/api/search/search.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Search/search_list_view.dart';
import 'package:ciying/widgets/custom_app_bar.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/widgets/SlideContainer.dart';
import 'package:ciying/page/User/UserDrawerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

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
    BottomNavigationBarItem(icon: Icon(Icons.cut_sharp), title: Text('关于我们')),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: CommonConfig.IsdebugShowCheckedModeBanner,
      home: Scaffold(
        backgroundColor: HexColor("#fff"),
        body: _ResourceListBody(widget.searchText),
        // bottomNavigationBar: BottomNavigationBar(
        //   onTap: (int index) {
        //     setState(() {
        //       this._selectedIndex = index;
        //     });
        //   },
        //   currentIndex: this._selectedIndex,
        //   items: _barItem,
        //   fixedColor: HexColor("#252C4E"),
        //   selectedFontSize: 12,
        //   type: BottomNavigationBarType.fixed,
        // ),
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: CommonConfig.IsdebugShowCheckedModeBanner,
    //   home: Scaffold(
    //     backgroundColor: HexColor("#fff"),
    //     body: getList(widget.searchText, this._selectedIndex),
    //     bottomNavigationBar: BottomNavigationBar(
    //       onTap: (int index) {
    //         setState(() {
    //           this._selectedIndex = index;
    //         });
    //       },
    //       currentIndex: this._selectedIndex,
    //       items: _barItem,
    //       fixedColor: HexColor("#252C4E"),
    //       selectedFontSize: 12,
    //       type: BottomNavigationBarType.fixed,
    //     ),
    //   ),
    // );
  }

  getList(String search, int selectedIndex) {
    if (selectedIndex == 0) {
      return _ResourceListBody(search);
    } else if (selectedIndex == 1) {
      return VipCustomPageContent();
    }
  }
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
                height: 100,
              ),
              Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset("assets/images/vipCustom.png"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "关于我们",
                style: TextStyle(
                    fontSize: 14,
                    color: HexColor("#252C4E"),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: AspectRatio(
                  aspectRatio: 1.8,
                  child: Image.asset("assets/images/support.png"),
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
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  bool _isLoading = true;
  bool _isError = false;
  int pageCout = 28;
  // List<CacheResourceSection> _resourceSection =
  //     new List<CacheResourceSection>();
  List<ResourceSection> _resourceSection = <ResourceSection>[];
  ScrollController _scrollController = ScrollController();

  int page = 0;
  bool isLoadingMore = true; //是否加载更多
  bool isLoading = false; //是否加载中
  bool isLoadMoreEnd = false; //是否加载完毕
  String showText = '';

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          isLoadMoreEnd = true;
          isLoading = true;
          page = _resourceSection.length;
        });
        _onLoadmore();
      }
    });
    setData();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    _performSearch();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  Future<void> setData() async {
    // animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 0.5;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 0.8;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  Future<List<ResourceSection>> _fetchData() async {
    SearchRequest searchRequest = SearchRequest();
    searchRequest.text = widget.searchText;
    searchRequest.offset = page;
    searchRequest.limit = pageCout;
    SearchResponse searchResponse =
        await Search.searchAPIRequest(searchRequest);
    if (searchResponse.size == _resourceSection.length) {
      //没有更多
      setState(() {
        _isError = true;
      });
    }
    return searchResponse.resourceSection;
  }

  _onLoadmore() async {
    if (!_isError && isLoadingMore) {
      _fetchData().then((data) {
        setState(() {
          _resourceSection.addAll(data);
          isLoading = true;
          isLoadingMore = true;
        });
      });
    }
  }

  void _performSearch() async {
    SearchRequest searchRequest = SearchRequest();
    searchRequest.text = widget.searchText;
    searchRequest.limit = pageCout;
    searchRequest.offset = 0;
    SearchResponse searchResponse =
        await Search.searchAPIRequest(searchRequest);
    // var resourceSection =
    //     await CacheSearch().cacheSearchBySearchText(searchRequest);
    if (searchResponse == null) {
      setState(() {
        _isError = true;
      });
      dialogShow(" \n\r 数据正在预热 \n\r 请过会再重试喔");
      return;
    }
    if (searchResponse.code != ResponseCode.SUCCESSFUL) {
      dialogShow("搜索结果不存在");
      setState(() {
        _isError = true;
      });
      return;
    }
    if (searchResponse.resourceSection == null) {
      dialogShow("请求失败，请稍后再试");
      setState(() {
        _isError = true;
      });
      return;
    }
    if (searchResponse.size <= 1) {
      dialogShow(" \n\r 数据正在预热 \n\r 请过会再重试喔");
      setState(() {
        _isError = true;
      });
      return;
    } else
      setState(() {
        _resourceSection.addAll(searchResponse.resourceSection);
        _isLoading = false;
        _isError = false;
      });
    return;
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
    YYDialog.init(context);
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
                                  shrinkWrap:
                                      true, // 该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false
                                  itemCount: _resourceSection.length,
                                  controller: _scrollController,
                                  padding: const EdgeInsets.only(top: 30),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (index + 1 == _resourceSection.length) {
                                      if (isLoadMoreEnd) {
                                        // _onLoadmore();
                                        if (_isError ||
                                            _isLoading ||
                                            !isLoadingMore) {
                                          return _buildLoadText(
                                              '暂时没有更多～ 请稍后重试\n\r我们会持续更新,欢迎反馈......');
                                        }
                                        return _buildLoadText('上拉加载更多~');
                                      } else {
                                        return _buildProgressIndicator();
                                      }
                                    }
                                    final int count =
                                        _resourceSection.length > 28
                                            ? 28
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

  ///加载更多布局
  Widget _buildLoadText(String text) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          // child: Text(text),
          child: Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF17262A).withOpacity(0.6),
            ),
          ),
        ),
      ),
      color: Colors.white70,
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoadingMore ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
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
            // height: 40,
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
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '视频深度分析引擎，智能视频分层，情感及行为分析',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF4A6572),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      // Navigator.push<dynamic>(
                      //   context,
                      //   MaterialPageRoute<dynamic>(
                      //       builder: (BuildContext context) => FiltersScreen(),
                      //       fullscreenDialog: true),
                      // );

                      // final result = await Navigator.push(
                      //     //等待
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => new FiltersScreen(),
                      //         fullscreenDialog: true));
                      // //SnackBar是用户操作后，显示提示信息的一个控件，类似Tost，会自动隐藏。SnackBar是以Scaffold的showSnackBar方法来进行显示的
                      // Scaffold.of(context)
                      //     .showSnackBar(SnackBar(content: Text('$result')));
                      // setState(() {
                      //   showText = '$result';
                      //   print(showText);
                      // });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '筛选',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                              // color: Color(0xFF4A6572),
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.sort,
                              // color: Color(0xFF4A6572),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
