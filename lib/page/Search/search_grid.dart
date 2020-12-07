// import 'package:ciying/api/search/search.dart';
// import 'package:ciying/common/constants.dart';
// import 'package:ciying/grpc/proto/search.pb.dart';
// import 'package:ciying/page/Search/search_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';

// class SearchGrid extends StatefulWidget {
//   final List<ResourceSection> _resourceSection;
//   final String searchText;
//   final bool _isLoading;
//   SearchGrid(this._resourceSection, this.searchText, this._isLoading);
//   @override
//   _SearchGridState createState() => new _SearchGridState();
// }

// class _SearchGridState extends State<SearchGrid> {
//   GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;
//   ScrollController _scrollController;
//   int offest = 1;
//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = new ScrollController();
//     _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
//     // 进入页面立即显示刷新动画
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       _refreshIndicatorKey.currentState?.show();
//     });

//     // _onRefresh();
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         _onLoadmore();
//       }
//     });
//   }

//   Future _fetchData(int offest) async {
//     SearchRequest searchRequest = SearchRequest();
//     searchRequest.text = widget.searchText;
//     searchRequest.limit = CommonConfig.SearchRequestDefaultLimit;
//     SearchResponse searchResponse =
//         await Search.searchAPIRequest(searchRequest);
//     return searchResponse.resourceSection;
//   }

//   // Future<dynamic> _onRefresh() {
//   //   widget._resourceSection.clear();
//   //   this.offest = 1;
//   //   return _fetchData(offest).then((data) {
//   //     setState(() => this.widget._resourceSection.addAll(data));
//   //   });
//   // }

//   Future<dynamic> _onLoadmore() {
//     this.offest += 1;
//     return _fetchData(offest).then((data) {
//       setState(() {
//         this.widget._resourceSection.addAll(data);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     int listIndex = widget._resourceSection.length ?? 0;
//     double _gridSize = MediaQuery.of(context).size.height; //88% of screen
//     bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
//     var columnCount = isLandscape ? 3 : 2;
//     return Container(
//         height: _gridSize,
//         child: GridView.count(
//             crossAxisCount: columnCount,
//             children: List.generate(
//               listIndex,
//               (index) {
//                 if (index == listIndex - 1 ?? 0) _onLoadmore();
//                 print(index);
//                 //   // dialogShow("正在加载");
//                 // } else {
//                 return SearchDetails(
//                   widget.searchText,
//                   widget._resourceSection[index],
//                 );
//               },
//             )));
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
// }
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
    // SearchResponse searchResponse = new SearchResponse();
    // await lock.synchronized(() async {
    SearchRequest searchRequest = SearchRequest();
    searchRequest.text = widget.searchText;
    searchRequest.offset = this.page;
    searchRequest.limit = 32;
    SearchResponse searchResponse =
        await Search.searchAPIRequest(searchRequest);
    // print('offset $searchRequest.offset');
    // });
    // lock.locked;
    // print(searchResponse.code);
    // print(searchResponse.resourceSection);
    // BotToast.showLoading();
    // if(searchResponse.code!=0){
    // }
    // if (searchResponse != null ||
    //     searchResponse.code == ResponseCode.SUCCESSFUL) {}
    return searchResponse.resourceSection;
  }

  // Future<dynamic> _onRefresh() {
  //   widget._resourceSection.clear();
  //   this.page = 0;
  //   return _fetchData().then((data) {
  //     setState(() => this.widget._resourceSection.addAll(data));
  //   });
  // }

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
    // double _gridSize = MediaQuery.of(context).size.height*0.78; //88% of screen

    // double childAspectRatio =  MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.3);
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    var columnCount = isLandscape ? 3 : 2;
    // double childAspectRatio = MediaQuery.of(context).size.width /
    //     (MediaQuery.of(context).size.height);
    // print(childAspectRatio);
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
          // Loading()
          loadingWidget(context, false)
        // else if()
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
                        // childAspectRatio: childAspectRatio * 2.8,
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
      // new MinimalCart(_gridSize)
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
