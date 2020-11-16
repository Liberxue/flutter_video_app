import 'package:bot_toast/bot_toast.dart';
import 'package:ciying/api/search.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/widgets/custom_app_bar.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/CartManager.dart';
import 'package:ciying/page/SearchGrid.dart';
import 'package:ciying/page/bloc/CartBloc.dart';
import 'package:ciying/util/hexColor.dart';
import 'package:ciying/widgets/SlideContainer.dart';
import 'package:ciying/widgets/UserDrawerPage.dart';
import 'package:ciying/widgets/custom_loading.dart';
import 'package:ciying/widgets/loadMoreWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResourceList extends StatelessWidget {
  final String searchText;
  ResourceList(this.searchText);
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          backgroundColor: HexColor("#1C284E"),
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

class __ResourceListBodyState extends State<_ResourceListBody>
    with TickerProviderStateMixin {
  bool _isLoading = true;

  AnimationController controller;
  Animation<double> animation;
  //cart
  bool _showCart = false;
  CartBloc _cartBloc;
  ScrollController _scrollController = new ScrollController();

  List<ResourceSection> _resourceSection;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
    // cart
    _scrollController = new ScrollController();
    _cartBloc = new CartBloc();
    super.initState();
    // request search
    _performSearch();
  }

  void _performSearch() async {
    SearchRequest searchRequest = SearchRequest();
    searchRequest.text = widget.searchText;
    searchRequest.limit = 100;
    SearchResponse searchResponse =
        await Search.searchAPIRequest(searchRequest);
    // print(searchResponse.code);
    // print(searchResponse.resourceSection);
    // BotToast.showLoading();
    // if(searchResponse.code!=0){
    // }
    setState(() {
      _resourceSection = searchResponse.resourceSection;
      _isLoading = false;
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
    double statusBarHeight = MediaQuery.of(context).padding.top - 50;
    height = MediaQuery.of(context).size.height - statusBarHeight;
    double widthBar = MediaQuery.of(context).size.width;
    if (_isLoading)
      return LoadMoreWidget();
    else
      return Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        child: SlideStack(
          drawer: UserDrawerPage(),
          child: SlideContainer(
            key: _slideKey,
            child: Container(
              width: widthBar,
              height: height * (1 - position / 5),
              child: Column(
                children: <Widget>[
                  CustomAppBar(
                    title: CommonConfig.ConfAppName,
                    height: kToolbarHeight * (1 - position / 5),
                    tapDrawer: () {
                      _slideKey.currentState.openOrClose();
                    },
                  ),
                  // if (_isLoading)
                  //   Expanded(
                  //       //child: Container(
                  //       //   margin: EdgeInsets.symmetric(horizontal: 10),
                  //       //   child: RaisedButton(
                  //       //     onPressed: () {
                  //       //       Navigator.push(
                  //       //           context,
                  //       //           MaterialPageRoute(
                  //       //               builder: (_) => CustomLoading()));
                  //       //     },
                  //       //     child: Text("CustomLoading"),
                  //       //   ),
                  //       // ),
                  //       )
                  // else
                  Expanded(
                      child: Stack(children: <Widget>[
                    new CustomScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _scrollController,
                        slivers: <Widget>[
                          new SliverToBoxAdapter(
                              child: new SearchGrid(_resourceSection)),
                          // cart 上浮页面
                          // new SliverToBoxAdapter(child:
                          //   new CartManager()
                          // ),
                        ]),
                    // new Align(
                    //     alignment: Alignment.bottomRight,
                    //     child:new Container(
                    //       margin: EdgeInsets.only(right: 10, bottom: 10),
                    //     child: new FloatingActionButton(onPressed: (){
                    //       if(_showCart)
                    //         _scrollController.animateTo(
                    //           _scrollController.position.minScrollExtent,
                    //           curve: Curves.fastOutSlowIn,
                    //           duration: Duration(seconds: 2));
                    //       else
                    //         _scrollController.animateTo(
                    //           _scrollController.position.maxScrollExtent,
                    //           curve: Curves.fastOutSlowIn,
                    //           duration: Duration(seconds: 2));

                    //       setState(() {

                    //       _showCart = !_showCart;

                    //       });
                    //     }, backgroundColor: Colors.transparent,
                    //       child: new Icon(_showCart ? Icons.close : Icons.movie,size:50))
                    //   )
                    // )
                  ]))
                ],
              ),
            ),
            slideDirection: SlideDirection.left,
            onSlide: onSlide,
            drawerSize: maxSlideDistance,
            transform:
                Matrix4.translationValues(0.0, height * position / 10, 0.0),
          ),
        ),
      );
  }

  @override
  void dispose() {
    controller.dispose();
    _cartBloc.dispose();
    super.dispose();
  }
}
