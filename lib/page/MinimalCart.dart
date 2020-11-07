import 'package:CiYing/models/Cart.dart';
import 'package:CiYing/page/VideoPlayer.dart';
import 'package:CiYing/page/bloc/CartBloc.dart';
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
            color: Colors.white,
            // color: Colors.grey.withOpacity(0.5),
             width: double.infinity, height: 100, child:
              new ListView.builder(scrollDirection: Axis.horizontal, itemCount: _listWidget.length, controller: _scrollController, itemBuilder: (context, index){
                return new Align(alignment: Alignment.center, child:_listWidget[index]);
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
        return new Padding(padding: EdgeInsets.symmetric(horizontal:3), child:
          new GestureDetector(child:
              new Hero(tag: "tagHeroOrder${order.resourceSection.sourceID}", child:
               new ClipOval(child:
                  new Container(
                      width: 120,
                      height: 80,
                      decoration: BoxDecoration(
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(16)
                        // ),
                        borderRadius: BorderRadius.circular(1),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(order.resourceSection.resourceAddress)
                          )
                      ),
                  )
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