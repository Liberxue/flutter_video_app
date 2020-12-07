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

class SearchList extends StatelessWidget {
  final String searchText;
  SearchList(this.searchText);
  @override
  Widget build(BuildContext context) => new MaterialApp(
        home: Scaffold(
          backgroundColor: HexColor("#fff"),
          body: _ResourceListBody(searchText),
        ),
      );
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
    // request search
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
