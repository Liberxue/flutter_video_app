import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/CategoryDropMenu.dart';
import 'package:ciying/page/MinimalCart.dart';
import 'package:ciying/page/ProductWidget.dart';
import 'package:flutter/material.dart';

class SearchGrid extends StatefulWidget {
  final List<ResourceSection> _resourceSection;
  SearchGrid(this._resourceSection);
 @override
  _SearchGridState createState() => new _SearchGridState();
}

class _SearchGridState extends State<SearchGrid> {
 
  @override
  Widget build(BuildContext context){

    double _gridSize = MediaQuery.of(context).size.height*0.88; //88% of screen
      // double _gridSize = MediaQuery.of(context).size.height*0.78; //88% of screen

    double childAspectRatio =  MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.3);

    return new Column(children: <Widget>[
      // new Header(),
      // new Container(height: _gridSize, decoration: BoxDecoration(color: const Color(0xFFeeeeee), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10), bottomRight: Radius.circular(_gridSize/10))), padding: EdgeInsets.only(left: 10, right: 10),
        new Container(height: _gridSize,
        color:  const Color(0xFFeeeeee), 
        padding: EdgeInsets.only(left: 2, right: 2),
        child:new Column(children: <Widget>[
          new Container(margin: EdgeInsets.only(top: 2), child:
          new Column(children: <Widget>[
            new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
              new CategoryDropMenu(),
              new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.filter_list), label: new Text("切换"))
            ]),
            if (widget._resourceSection!=null && widget._resourceSection.length>0)
                new Container(height: _gridSize - 52, margin: EdgeInsets.only(top: 2), child:
                  new PhysicalModel(
                      color: Colors.transparent,
                      // borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10 - 10), bottomRight: Radius.circular(_gridSize/10 - 10)),
                      clipBehavior: Clip.antiAlias,
                      child: new GridView.builder(
                          itemCount: widget._resourceSection.length,
                           gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: childAspectRatio),
                          itemBuilder: (BuildContext context, int index) {
                            return new Padding(
                                // padding: EdgeInsets.only(top: index%2==0 ? 20 : 0, right: index%2==0 ? 5 : 0, left: index%2==1 ? 5 : 0, bottom: index%2==1 ? 20 : 0),
                                padding: EdgeInsets.only(left: 2, right: 2,bottom:2),
                                child: ProductWidget(widget._resourceSection[index]));
                          }
                      )
                  )
                )
          ])
          )
        ])
      ),
      // new MinimalCart(_gridSize),
    ]);
  }

}