import 'package:CiYing/models/Order.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {

  final Order _order;
  final double _gridSize;
  OrderWidget(this._order, this._gridSize);

  @override
  Widget build(BuildContext context) {
    
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
      new ClipOval(child:
        CachedNetworkImage(
            width:100,
            height: 100,
            imageUrl: this._order.resourceSection.resourceAddress,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      new Padding(padding: EdgeInsets.symmetric(horizontal: 5), child:
        new Text(this._order.resourceSection.sourceName.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
      ),
      new Text(":", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      new Flexible(flex: 2, child:
        new Padding(padding: EdgeInsets.symmetric(horizontal: 5), child:
          new Text(this._order.resourceSection.source, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
        )
      ),
      new Flexible(flex: 1, child:
        new Text("${this._order.id.toStringAsFixed(2)}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
      )
    ]);
  }

}