import 'package:ciying/api/search/search.dart';
import 'package:ciying/cache/cache_search.dart';
import 'package:ciying/cache/entity/resource_section.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Search/search_details.dart';
import 'package:ciying/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SearchGrid extends StatefulWidget {
  final List<CacheResourceSection> _resourceSection;
  final String searchText;
  final bool _isLoading;
  SearchGrid(this._resourceSection, this.searchText, this._isLoading);
  @override
  _SearchGridState createState() => new _SearchGridState();
}

class _SearchGridState extends State<SearchGrid> {
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;
  ScrollController _scrollController;
  int page = 1;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
    // 进入页面立即显示刷新动画
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState?.show();
    });

    _onRefresh();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _onLoadmore();
      }
    });
  }

  Future _fetchData(int page) async {
    // SearchRequest searchRequest = SearchRequest();
    // searchRequest.text = widget.searchText;
    // searchRequest.limit = CommonConfig.SearchRequestDefaultLimit;
    // SearchResponse searchResponse =
    //     await Search.searchAPIRequest(searchRequest);
    // // print(searchResponse.code);
    // // print(searchResponse.resourceSection);
    // // BotToast.showLoading();
    // // if(searchResponse.code!=0){
    // // }
    // return searchResponse.resourceSection;
    SearchRequest searchRequest = SearchRequest();
    searchRequest.text = widget.searchText;
    searchRequest.limit = page;
    searchRequest.offset = 20;
    return await CacheSearch().cacheSearchBySearchText(searchRequest);
  }

  Future<dynamic> _onRefresh() {
    widget._resourceSection.clear();
    this.page = 1;
    return _fetchData(page).then((data) {
      setState(() => this.widget._resourceSection.addAll(data));
    });
  }

  Future<dynamic> _onLoadmore() {
    this.page += 1;
    return _fetchData(page).then((data) {
      setState(() {
        this.widget._resourceSection.addAll(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var length = widget._resourceSection?.length - 1 ?? 0;

    double _gridSize = MediaQuery.of(context).size.height; //88% of screen
    // double _gridSize = MediaQuery.of(context).size.height*0.78; //88% of screen

    // double childAspectRatio =  MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.3);
    double childAspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height);
    print(childAspectRatio);
    return new Column(children: <Widget>[
      new Container(
          // height: _gridSize,
          // decoration: BoxDecoration(
          //   color: HexColor("#FFF"),
          // ),
          padding: EdgeInsets.only(left: 4, right: 4, top: 1),
          child: new Column(children: <Widget>[
            new Container(
                child: new Column(children: <Widget>[
              // new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //  children: <Widget>[
              //   new CategoryDropMenu(),
              //   new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.filter_list), label: new Text("切换"))
              // ]),
              new Container(
                  height: _gridSize,
                  // margin: EdgeInsets.only(top: 5),
                  child: new PhysicalModel(
                      color: Colors.white,
                      child: new GridView.builder(
                        itemCount: widget._resourceSection.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // childAspectRatio: childAspectRatio * 2.8,
                          childAspectRatio: 1.25,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == length) {
                            _onLoadmore();
                            dialogShow("正在加载");
                          } else
                            return new Padding(
                              padding:
                                  EdgeInsets.only(left: 5, right: 5, bottom: 5),
                              child: SearchDetails(widget.searchText,
                                  widget._resourceSection[index]),
                            );
                        },
                      )))
            ]))
          ])),
      // new MinimalCart(_gridSize)
    ]);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}