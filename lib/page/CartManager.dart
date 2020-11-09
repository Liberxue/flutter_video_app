import 'package:CiYing/models/Cart.dart';
import 'package:CiYing/page/OrderWidget.dart';
import 'package:CiYing/page/bloc/CartBloc.dart';
import 'package:flutter/material.dart';

class CartManager extends StatefulWidget {
  @override
  _CartManager createState() => new _CartManager();
}

class _CartManager extends State<CartManager> {

  CartBloc _cartBloc = new CartBloc();

  @override
  Widget build(BuildContext context) {

    double _gridSize = MediaQuery.of(context).size.height*0.9;

    return new Container(
    // margin: EdgeInsets.only(top: _gridSize*0.4),
      height: MediaQuery.of(context).size.height,
      color:  const Color(0xFFeeeeee), 
     child:new Stack(children: <Widget>[
          new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            new StreamBuilder(initialData: _cartBloc.currentCart, stream: _cartBloc.observableCart, builder: (context, AsyncSnapshot<Cart> snapshot){
              return
                new Container(margin: EdgeInsets.symmetric(horizontal: 8), height: _gridSize, width: double.infinity, child:
                  new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: _gridSize*0.18), child:
                      new Text("选集列表", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))
                    ),
                    new Container( height: _gridSize*0.72, child:
                      new ListView.builder(itemCount: snapshot.data.orders.length, itemBuilder: (context, index ){
                        return Dismissible(
                          background: Container(color: Colors.red, child:new Row(mainAxisAlignment: MainAxisAlignment.end,
                           children: <Widget>[
                            new Text("滑动移除", style: TextStyle(color: Colors.white, fontSize: 18)),
                            // new Text("滑动移除", style: TextStyle(color: Colors.white, fontSize: 18)),
                         ]
                      )),
                          key: Key(snapshot.data.orders[index].resourceSection.sourceName.toString()),
                          onDismissed: (_) {
                            _cartBloc.removerOrderOfCart(snapshot.data.orders[index]);
                          },
                          child: new Padding(padding: EdgeInsets.symmetric(vertical: 10), child: new OrderWidget(snapshot.data.orders[index], _gridSize)),
                        );
                      })
                    ),
                    new Container(
                    // margin: EdgeInsets.only(top: _gridSize*0.1),
                    height:40,
                     child:new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        new Text("消费积分", style: TextStyle(color: Colors.black, fontSize: 20)),
                        new Text("${snapshot.data.totalPrice().toStringAsFixed(2)}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40)),
                      ])
                    )
                  ])
                );
            })
          ]),
          new Align(alignment: Alignment.bottomLeft, child:
            new Container(
            padding: EdgeInsets.only(left: 10,
             bottom: _gridSize*0.02), 
              width: MediaQuery.of(context).size.width - 200, 
              height:80,
              child:new RaisedButton(color: Colors.amber, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)), padding: EdgeInsets.all(20),
                  onPressed: (){
                    if(_cartBloc.currentCart.isEmpty)
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("空空如也～")));
                  },
                  child: new Text("批量下载", style: TextStyle(fontWeight: FontWeight.bold))
              )
            )
          )
        ])
    );
  }
}