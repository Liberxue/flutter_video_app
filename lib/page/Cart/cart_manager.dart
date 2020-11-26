import 'dart:ui';

import 'package:ciying/models/Cart.dart';
import 'package:ciying/page/Order/order_widget.dart';
import 'package:ciying/page/bloc/CartBloc.dart';
import 'package:ciying/widgets/SeparatorLine.dart';
import 'package:flutter/material.dart';

class CartManager extends StatefulWidget {
  @override
  _CartManager createState() => new _CartManager();
}

class _CartManager extends State<CartManager>
    with SingleTickerProviderStateMixin {
  CartBloc _cartBloc = new CartBloc();

  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _gridSize = MediaQuery.of(context).size.height * 0.9;
    List<String> _urlList = List<String>();
    return new Container(
        // margin: EdgeInsets.only(top: _gridSize*0.4),
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: new Stack(children: <Widget>[
          new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new StreamBuilder(
                    initialData: _cartBloc.currentCart,
                    stream: _cartBloc.observableCart,
                    builder: (context, AsyncSnapshot<Cart> snapshot) {
                      return new Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: _gridSize,
                          width: double.infinity,
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                    padding: EdgeInsets.only(
                                        top: _gridSize * 0.15,
                                        bottom: _gridSize * 0.02),
                                    child: new Text("选集列表",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold))),
                                new Container(
                                    height: _gridSize * 0.68,
                                    child: new ListView.builder(
                                        itemCount: snapshot.data.orders.length,
                                        itemBuilder: (context, index) {
                                          _urlList.add(snapshot
                                              .data
                                              .orders[index]
                                              .resourceSection
                                              .resourceAddress);
                                          return Dismissible(
                                            background: Container(
                                                color: Colors.red,
                                                child: new Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      new Text("滑动移除",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18)),
                                                      // new Text("滑动移除", style: TextStyle(color: Colors.white, fontSize: 18)),
                                                    ])),
                                            key: Key(snapshot.data.orders[index]
                                                .resourceSection.sourceName
                                                .toString()),
                                            onDismissed: (_) {
                                              _urlList.remove(snapshot
                                                  .data
                                                  .orders[index]
                                                  .resourceSection
                                                  .resourceAddress);
                                              _cartBloc.removerOrderOfCart(
                                                  snapshot.data.orders[index]);
                                            },
                                            child: new Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: Column(
                                                children: <Widget>[
                                                  new OrderWidget(
                                                      snapshot
                                                          .data.orders[index],
                                                      _gridSize),
                                                  // new SeparatorLine(height: 1,color: Colors.grey,width: 1),
                                                  // Container(
                                                  //   child: Center(
                                                  //     child: LinearProgressIndicator(
                                                  //       backgroundColor: Colors.black12,
                                                  //         valueColor: new AlwaysStoppedAnimation<Color>(
                                                  //           Colors.blueGrey,
                                                  //         ),
                                                  //         value: .5,
                                                  //     ),
                                                  //  ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })),
                                SeparatorLine(
                                  height: 1,
                                  color: Colors.grey,
                                  width: 10,
                                ),
                                new Container(
                                    // margin: EdgeInsets.only(top: _gridSize*0.1),
                                    height: 40,
                                    child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          new Text("消费积分",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20)),
                                          new Text(
                                              "${snapshot.data.totalPrice().toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ]))
                              ]));
                    })
              ]),
          new Align(
              alignment: Alignment.bottomLeft,
              child: new Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    bottom: _gridSize * 0.02,
                  ),
                  width: MediaQuery.of(context).size.width - 250,
                  height: 60,
                  child: new RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)),
                      padding: EdgeInsets.all(10),
                      onPressed: () async {
                        if (_cartBloc.currentCart.isEmpty ||
                            _urlList.length <= 0)
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("没有什么可以下载～～")));
                        else
                          print(_urlList);
                      },
                      child: new Text("一键下载",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))))
        ]));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
