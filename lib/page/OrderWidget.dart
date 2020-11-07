import 'package:CiYing/models/Order.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {

  final Order _order;
  final double _gridSize;
  OrderWidget(this._order, this._gridSize);

  @override
  Widget build(BuildContext context) {
    return new Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      new ClipOval(child:
        // new Container(
        //   color: Colors.white, 
        //   child: new Image.network(this._order.resourceSection.resourceAddress),
        //  height:  (MediaQuery.of(context).size.height - _gridSize)* 0.5,
        //  )
        Container(
          width: 120,
         height:  (MediaQuery.of(context).size.height - _gridSize)* 1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(this._order.resourceSection.resourceAddress)
            )
          )
        ),
      ),
      new Padding(padding: EdgeInsets.symmetric(horizontal: 10), child:
        new Text(this._order.resourceSection.sourceName.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
      ),
      new Text(":", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      new Flexible(flex: 2, child:
        new Padding(padding: EdgeInsets.symmetric(horizontal: 10), child:
          new Text(this._order.resourceSection.source, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
        )
      ),
      new Flexible(flex: 1, child:
        new Text("${this._order.id.toStringAsFixed(2)}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
      )
    ]);
  }

}