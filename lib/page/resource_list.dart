import 'dart:ui';

import 'package:ciying/api/search.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/CartManager.dart';
import 'package:ciying/page/SearchGrid.dart';
import 'package:ciying/page/bloc/CartBloc.dart';
import 'package:ciying/widgets/SlideContainer.dart';
import 'package:ciying/widgets/UserDrawerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResourceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(65.0),
        //   child: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   actions: <Widget>[
        //     IconButton(
        //         icon: Icon(Icons.search, color: Colors.black), onPressed: () {})
        //   ],
        //   leading: IconButton(
        //       icon: Icon(Icons.menu, color: Colors.black), onPressed: () {
                
        //   }),
        //   title: Text(
        //     "词影",
        //     style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        //   ),
        //   centerTitle: true,
        // ),
        // ),
       backgroundColor: Colors.black,
          body: _Body(),
        ),
      );
}

class _Body extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<_Body> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;
  //cart
  bool _showCart = false;
  CartBloc _cartBloc;
  ScrollController _scrollController = new ScrollController();

  List<ResourceSection> _resourceSection;


  Future _performSearch() async {
    SearchRequest searchRequest=SearchRequest();
    searchRequest.text="";
    searchRequest.limit=100;
    SearchResponse searchResponse=await Search.searchAPIRequest(searchRequest);
    print(searchResponse.code);
    print(searchResponse.resourceSection);
    setState(() {
      _resourceSection=searchResponse.resourceSection;
    });
  }
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
    _performSearch();
    super.initState();
  }
  double position = 0.0;
  double height = 0.0;

  double get maxSlideDistance => MediaQuery.of(context).size.width * 0.88;

  final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();

  void onSlide(double position) {
    setState(() => this.position = position);
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    height = MediaQuery.of(context).size.height - statusBarHeight;

    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),
      child: SlideStack(
        drawer: UserDrawerPage(),
        child: SlideContainer(
          key: _slideKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: height * (1 - position / 5),
            child: Column(
              children: <Widget>[
                CustomAppBar(
                  title: '词影',
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
                        new SliverToBoxAdapter(child:
                        new SearchGrid(_resourceSection)
                      ),
                      new SliverToBoxAdapter(child:
                        new CartManager()
                      ),
                  ]),
                  new Align(
                      alignment: Alignment.bottomRight, child:
                      new Container(margin: EdgeInsets.only(right: 10, bottom: 10),child:
                        new FloatingActionButton(onPressed: (){
                        if(_showCart)
                          _scrollController.animateTo(
                            _scrollController.position.minScrollExtent,
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(seconds: 2));
                        else
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent, 
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(seconds: 2));

                        setState(() {

                        _showCart = !_showCart;

                        });
                      }, backgroundColor: Colors.transparent, 
                        child: new Icon(_showCart ? Icons.close : Icons.movie,size:50))
                    )
                  )
                ])
                )
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

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback tapDrawer;
  final double height;

  const CustomAppBar({Key key, this.title, this.tapDrawer, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      height: height,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: tapDrawer,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 20.0),
              child: Icon(
                Icons.dehaze,
                color: Colors.grey,
              ),
            ),
          ),
                GestureDetector(
            onTap: tapDrawer,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 20.0),
              child: Icon(
                Icons.dehaze,
                color: Colors.grey,
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
