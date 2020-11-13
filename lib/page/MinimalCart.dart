import 'package:ciying/models/Cart.dart';
import 'package:ciying/page/VideoPlayer.dart';
import 'package:ciying/page/bloc/CartBloc.dart';
import 'package:ciying/widgets/SeparatorLine.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class MinimalCart extends StatelessWidget {

  final double _gridSize;
  final List<Widget> _listWidget = new List();
  final CartBloc _cartBloc = new CartBloc();
  static final ScrollController _scrollController =  new ScrollController();
  MinimalCart(this._gridSize);

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(initialData: _cartBloc.currentCart, stream: _cartBloc.observableCart, builder: (context, AsyncSnapshot<Cart> snapshot) {
          _fillList(snapshot.data, context);
          var content =
            new Container(
              padding: EdgeInsets.only(bottom: 110),
            color: Colors.white,
            // color: Colors.white.withOpacity(0.9),
             width: double.infinity, height: MediaQuery.of(context).size.height - _gridSize, child:
              new ListView.builder(scrollDirection: Axis.horizontal, itemCount: _listWidget.length, controller: _scrollController, itemBuilder: (context, index){
                return new Align(alignment: Alignment.centerLeft, child:_listWidget[index]);
              })
            );
          try{
            _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          }catch(e){
            //TODO fix
            print(e);
          }
          return content;
        }
      );
  }
  
  void _fillList(Cart cart, BuildContext context){
    _listWidget.add(new Text("选集", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)));
    _listWidget.addAll(cart.orders.map((order){
        return new Padding(padding: EdgeInsets.symmetric(horizontal:2), child:
          new GestureDetector(child:
              new Hero(tag: "tagHeroOrder${order.resourceSection.sourceID}", child:
               new ClipOval(child:
                  new CachedNetworkImage(
                    width:80,
                    height: 90,
                    imageUrl: order.resourceSection.resourceAddress,
                    fit: BoxFit.contain,
                    progressIndicatorBuilder: (context, url, downloadProgress) => 
                            CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                ),
            ),
            onTap: (){
                Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VideoPlayer(order.resourceSection),
                ),
              );
            },
          )
        );
    }).toList());
  }

}