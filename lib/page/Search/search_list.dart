import 'package:ciying/cache/cache_search.dart';
import 'package:ciying/cache/entity/resource_section.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/widgets/custom_app_bar.dart';
import 'package:ciying/page/Search/search_grid.dart';
import 'package:ciying/page/bloc/CartBloc.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/widgets/SlideContainer.dart';
import 'package:ciying/page/User/UserDrawerPage.dart';
import 'package:ciying/widgets/loading_widget.dart';
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

class __ResourceListBodyState extends State<_ResourceListBody>
    with TickerProviderStateMixin {
  bool _isLoading = true;
  AnimationController controller;
  Animation<double> animation;
  //cart
  bool _showCart, _isError = false;
  CartBloc _cartBloc = new CartBloc();
  ScrollController _scrollController = new ScrollController();

  List<CacheResourceSection> _resourceSection =
      new List<CacheResourceSection>();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
    // cart
    _scrollController = new ScrollController();
    _cartBloc = new CartBloc();

    // request search
    _performSearch();
  }

  void _performSearch() async {
    SearchRequest searchRequest = SearchRequest();
    searchRequest.text = widget.searchText;
    searchRequest.limit = 1;
    searchRequest.offset = 20;
    // SearchResponse searchResponse =
    //     await Search.searchAPIRequest(searchRequest);
    var resourceSection =
        await CacheSearch().cacheSearchBySearchText(searchRequest);
    if (resourceSection == null)
      setState(() {
        _isError = true;
      });
    else
      setState(() {
        _resourceSection.addAll(resourceSection);
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
    double statusBarHeight;
    if (MediaQuery.of(context).padding.top == null ||
        MediaQuery.of(context).padding.top == 0)
      statusBarHeight = MediaQuery.of(context).padding.top - 40;
    else
      statusBarHeight = MediaQuery.of(context).padding.top - 15;

    height = MediaQuery.of(context).size.height - statusBarHeight;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 1),
      child: SlideStack(
        drawer: UserDrawerPage(),
        child: SlideContainer(
          key: _slideKey,
          child: Container(
            // width: widthBar,
            // height: height * (1 - position / 5),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                CustomAppBar(
                  title: widget.searchText,
                  height: kToolbarHeight * (1 - position / 5),
                  tapDrawer: () {
                    _slideKey.currentState.openOrClose();
                  },
                ),
                Expanded(
                    child: Stack(children: <Widget>[
                  new CustomScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _scrollController,
                      slivers: <Widget>[
                        new SliverToBoxAdapter(
                          child: this._isLoading
                              ? loadingWidget(context, _isError)
                              : new SearchGrid(_resourceSection,
                                  widget.searchText, _isLoading),
                        ),
                        // cart 上浮页面
                        // new SliverToBoxAdapter(child: new CartManager()),
                      ]),
                  // new Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: new Container(
                  //         margin: EdgeInsets.only(right: 10, bottom: 10),
                  //         child: new FloatingActionButton(
                  //             onPressed: () {
                  //               if (_showCart)
                  //                 _scrollController.animateTo(
                  //                     _scrollController
                  //                         .position.minScrollExtent,
                  //                     curve: Curves.fastOutSlowIn,
                  //                     duration: Duration(seconds: 2));
                  //               else
                  //                 _scrollController.animateTo(
                  //                     _scrollController
                  //                         .position.maxScrollExtent,
                  //                     curve: Curves.fastOutSlowIn,
                  //                     duration: Duration(seconds: 2));

                  //               setState(() {
                  //                 _showCart = !_showCart;
                  //               });
                  //             },
                  //             backgroundColor: Colors.transparent,
                  //             child: new Icon(
                  //                 _showCart ? Icons.close : Icons.movie,
                  //                 size: 50))))
                ]))
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
    controller.dispose();
    _cartBloc.dispose();
    super.dispose();
  }
}
