import 'package:ciying/api/search.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/ProductWidget.dart';
import 'package:ciying/util/hexColor.dart';
import 'package:ciying/widgets/loadMoreWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SearchGrid extends StatefulWidget {
  final List<ResourceSection> _resourceSection;
  SearchGrid(this._resourceSection);
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
      print("_onRefresh");
      print(_scrollController.position.pixels);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _onLoadmore();
      }
    });
  }

  Future _fetchData() async {
    SearchRequest searchRequest = SearchRequest();
    searchRequest.text = "hhhh";
    searchRequest.limit = 100;
    SearchResponse searchResponse =
        await Search.searchAPIRequest(searchRequest);
    // print(searchResponse.code);
    // print(searchResponse.resourceSection);
    // BotToast.showLoading();
    // if(searchResponse.code!=0){
    // }
    return searchResponse.resourceSection;
  }

  Future<dynamic> _onRefresh() {
    widget._resourceSection.clear();
    this.page += 1;
    print(page);
    return _fetchData().then((data) {
      setState(() => this.widget._resourceSection.addAll(data));
    });
  }

  Future<dynamic> _onLoadmore() {
    this.page++;
    return _fetchData().then((data) {
      setState(() {
        print(data);
        this.widget._resourceSection.addAll(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var length = widget._resourceSection?.length - 1 ?? 0;

    double _gridSize = MediaQuery.of(context).size.height - 80; //88% of screen
    // double _gridSize = MediaQuery.of(context).size.height*0.78; //88% of screen

    // double childAspectRatio =  MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.3);
    double childAspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height / 2.1);
    if (widget._resourceSection == null)
      return LoadMoreWidget();
    else
      return new Column(children: <Widget>[
        new Container(
            height: _gridSize,
            decoration: BoxDecoration(
              color: HexColor("#E5E6EA"),
            ),
            padding: EdgeInsets.only(left: 4, right: 4),
            child: new Column(children: <Widget>[
              new Container(
                  child: new Column(children: <Widget>[
                // new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //  children: <Widget>[
                //   new CategoryDropMenu(),
                //   new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.filter_list), label: new Text("切换"))
                // ]),
                new Container(
                    height: _gridSize - 10,
                    // margin: EdgeInsets.only(top: 5),
                    child: new PhysicalModel(
                        color: Colors.transparent,
                        // borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10 - 10), bottomRight: Radius.circular(_gridSize/10 - 10)),
                        // clipBehavior: Clip.antiAlias,
                        child: new GridView.builder(
                          itemCount: widget._resourceSection.length,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: childAspectRatio),
                          itemBuilder: (BuildContext context, int index) {
                            if (index == length) {
                              _onRefresh();
                              LoadMoreWidget();
                            } else
                              return new Padding(
                                  // padding: EdgeInsets.only(top: index%2==0 ? 20 : 0, right: index%2==0 ? 5 : 0, left: index%2==1 ? 5 : 0, bottom: index%2==1 ? 20 : 0),
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, bottom: 5),
                                  child: ProductWidget(
                                      widget._resourceSection[index]));
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
