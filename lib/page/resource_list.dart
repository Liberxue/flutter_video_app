import 'package:ciying/api/search.dart';
import 'package:ciying/components/rounded_input_field.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/CartManager.dart';
import 'package:ciying/page/SearchGrid.dart';
import 'package:ciying/page/bloc/CartBloc.dart';
import 'package:ciying/page/head_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resourceList extends StatefulWidget {

  var isShow = false;
  @override
  _ResourceListState createState() => _ResourceListState();

  
}

class _ResourceListState extends State<resourceList>with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  //cart
  bool _showCart = false;
  CartBloc _cartBloc;
  ScrollController _scrollController = new ScrollController();

//  TextEditingController searchQueryController = TextEditingController();

//   bool _isLoading = false;
  List<ResourceSection> _resourceSection;
//   bool _searchDone = false;
//   bool _searchHeaderShow = false;

  Future _performSearch() async {
    // final String query = searchQueryController.text;
    SearchRequest searchRequest=SearchRequest();
    searchRequest.text="";
    searchRequest.limit=100;
    SearchResponse searchResponse=await Search.searchAPIRequest(searchRequest);
    print(searchResponse.code);
    // print(searchResponse.message);
    print(searchResponse.resourceSection);
    setState(() {
      _resourceSection=searchResponse.resourceSection;
      // _searchDone = true;
      // _isLoading = false;
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
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.black), onPressed: () {})
          ],
          leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black), onPressed: () {}),
          title: Text(
            "词影",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        ),
       backgroundColor: Colors.black, body:
      new Stack(children: <Widget>[
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
            }, backgroundColor: Colors.blueGrey, 
               child: new Icon(_showCart ? Icons.close : Icons.movie))
          )
        )
      ])
    );
}
@override
  void dispose() {
    controller.dispose();
    _cartBloc.dispose();
    super.dispose();
  }

}

void _flavModalBottomSheet(BuildContext context) {
  print("_flavModalBottomSheet");
}