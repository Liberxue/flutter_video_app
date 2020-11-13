import 'package:ciying/grpc/proto/search.pb.dart';
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

    double _gridSize = MediaQuery.of(context).size.height; //88% of screen
      // double _gridSize = MediaQuery.of(context).size.height*0.78; //88% of screen

    // double childAspectRatio =  MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.3);
    double childAspectRatio =  MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.45);

    // return new Column(children: <Widget>[
    //   // new Header(),
    //   // new Container(height: _gridSize, decoration: BoxDecoration(color: const Color(0xFFeeeeee), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10), bottomRight: Radius.circular(_gridSize/10))), padding: EdgeInsets.only(left: 10, right: 10),
    //     new Container(height: _gridSize,
    //     color:  Colors.white, 
    //     padding: EdgeInsets.only(left: 2, right: 2),
    //     child:new Column(children: <Widget>[
    //       new Container(margin: EdgeInsets.only(top: 2), child:
    //       new Column(children: <Widget>[
    //         new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
    //           new CategoryDropMenu(),
    //           new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.filter_list), label: new Text("切换"))
    //         ]),
    //         if (widget._resourceSection!=null && widget._resourceSection.length>0)
    //             new Container(height: _gridSize - 52, margin: EdgeInsets.only(top: 2), child:
    //               new PhysicalModel(
    //                   color: Colors.transparent,
    //                   // borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10 - 10), bottomRight: Radius.circular(_gridSize/10 - 10)),
    //                   clipBehavior: Clip.antiAlias,
    //                   child: new GridView.builder(
    //                       itemCount: widget._resourceSection.length,
    //                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
    //                         crossAxisCount: 2, childAspectRatio: childAspectRatio),
    //                       itemBuilder: (BuildContext context, int index) {
    //                         return new Padding(
    //                             // padding: EdgeInsets.only(top: index%2==0 ? 20 : 0, right: index%2==0 ? 5 : 0, left: index%2==1 ? 5 : 0, bottom: index%2==1 ? 20 : 0),
    //                             padding: EdgeInsets.only(left: 5, right: 5,bottom:5),
    //                             child: ProductWidget(widget._resourceSection[index]));
    //                       }
    //                   )
    //               )
    //             )
    //       ])
    //       )
    //     ])
    //   ),
    //   // new MinimalCart(_gridSize),
    // ]
      return new Column(children: <Widget>[
      new Container(
      height: _gridSize, decoration: BoxDecoration(color: const Color.fromRGBO(228,235,235,1),
      //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10), 
      //  bottomRight: Radius.circular(_gridSize/10)
      //  )
       ),
        padding: EdgeInsets.all(2), 
        child:new Column(children: <Widget>[
          new Container(
          child:new Column(children: <Widget>[
            // new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //  children: <Widget>[
            //   new CategoryDropMenu(),
            //   new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.filter_list), label: new Text("切换"))
            // ]),
            new Container(
              height: _gridSize - 10, margin: EdgeInsets.only(top: 5),
               child:
              new PhysicalModel(
                  color: Colors.transparent,
                  // borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(_gridSize/10 - 10), bottomRight: Radius.circular(_gridSize/10 - 10)),
                  // clipBehavior: Clip.antiAlias,
                  child: new GridView.builder(
                      itemCount: widget._resourceSection.length, gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: childAspectRatio),
                      itemBuilder: (BuildContext context, int index) {
                        return new Padding(
                            // padding: EdgeInsets.only(top: index%2==0 ? 20 : 0, right: index%2==0 ? 5 : 0, left: index%2==1 ? 5 : 0, bottom: index%2==1 ? 20 : 0),
                            padding: EdgeInsets.only(left: 5, right: 5,bottom:5),
                            child: ProductWidget(widget._resourceSection[index]));
                      }
                  )
              )
            )
          ])
          )
        ])
      ),
      // new MinimalCart(_gridSize)
    ]
    );
  }

}