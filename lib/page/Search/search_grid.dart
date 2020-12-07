import 'package:ciying/Widgets/loading_widget.dart';
import 'package:ciying/api/search/search.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Search/search_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

class SearchGrid extends StatefulWidget {
  final List<ResourceSection> _resourceSection;
  final String searchText;
  SearchGrid(this._resourceSection, this.searchText);
  @override
  _SearchGridState createState() => new _SearchGridState();
}

class _SearchGridState extends State<SearchGrid> {
  // GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;
  ScrollController _scrollController;
  int page = 0;
  bool isLoadingMore = true; //是否加载更多
  bool isLoading = false; //是否加载中
  bool isLoadMoreEnd = false; //是否加载完毕

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    // _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
    // // 进入页面立即显示刷新动画
    // // SchedulerBinding.instance.addPostFrameCallback((_) {
    // //   _refreshIndicatorKey.currentState?.show();
    // //   _buildProgressIndicator();
    // // });
    // _onRefresh();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          isLoadMoreEnd = true;
        });
        _onLoadmore();
      }
    });
  }

  Future<List<ResourceSection>> _fetchData() async {
    SearchRequest searchRequest = SearchRequest();
    searchRequest.text = widget.searchText;
    searchRequest.offset = this.page;
    searchRequest.limit = 32;
    SearchResponse searchResponse =
        await Search.searchAPIRequest(searchRequest);
    return searchResponse.resourceSection;
  }

  _onLoadmore() async {
    if (!isLoading) {
      page++;
      await Future.delayed(Duration(seconds: 3), () {
        _fetchData().then((data) {
          setState(() {
            widget._resourceSection.addAll(data);
            isLoading = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var length = widget._resourceSection?.length ?? 0;
    YYDialog.init(context);
    double _gridSize = MediaQuery.of(context).size.height; //88% of screen
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    var columnCount = isLandscape ? 3 : 2;
    return new Column(children: <Widget>[
      new Center(
          // height: _gridSize,
          // decoration: BoxDecoration(
          //   color: HexColor("#FFF"),
          // ),
          // padding: EdgeInsets.only(left: 4, right: 4, top: 1),
          child: new Column(children: <Widget>[
        // new Container(
        // child: new Column(children: <Widget>[
        // new Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       new CategoryDropMenu(),
        //       new FlatButton.icon(
        //           onPressed: () {},
        //           icon: new Icon(Icons.filter_list),
        //           label: new Text("切换"))
        //     ]),
        //         bool isTimeOut = false;
        if (widget._resourceSection.length < 1)
          loadingWidget(context, false)
        else
          new Container(
              height: _gridSize,
              child: new PhysicalModel(
                  color: Colors.white,
                  child: new GridView.builder(
                      itemCount: widget._resourceSection.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columnCount,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        if (index + 1 == length) {
                          _onLoadmore();
                          if (isLoadMoreEnd) {
                            return _buildLoadText('没有更多数据');
                          } else {
                            return _buildProgressIndicator();
                          }
                        } else {
                          return new Padding(
                            padding:
                                EdgeInsets.only(left: 5, right: 5, bottom: 5),
                            child: SearchDetails(widget.searchText,
                                widget._resourceSection[index]),
                          );
                        }
                      })))
      ])),
    ]);
  }

  ///加载更多布局
  Widget _buildLoadText(String text) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Text(text),
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

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
