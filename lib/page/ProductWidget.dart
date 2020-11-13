import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/VideoPlayer.dart';
import 'package:ciying/page/icon.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {

  final ResourceSection _resourceSection;

  ProductWidget(this._resourceSection);

  @override
  Widget build(BuildContext context){

    // double height = MediaQuery.of(context).size.height/1.0;
    // double fontSize = (height/24).round().toDouble();
    // bool isLiked = true;
    // final double _tileHeight = MediaQuery.of(context).size.height /3;
    // TextStyle authorStyle = TextStyle(
    //   fontSize: 10,
    //   color: Colors.white,
    //   letterSpacing: 1,
    // );

    // return new Stack(
    //       children: <Widget>[
    //             Container(
    //             child: Container(
    //               height: _tileHeight,
    //               width: double.infinity,
    //               padding: const EdgeInsets.all(5),
    //               child: Hero(
    //                 tag: '${_resourceSection.sourceID}',
    //                 child: Material(
    //                   color: Colors.black12,
    //                   borderRadius: BorderRadius.circular(14),
    //                   shadowColor: Colors.grey.withOpacity(0.5),
    //                   elevation: 10.0,
    //                   child: GestureDetector(
    //                     onTap: () {
    //                     Navigator.of(context).push(
    //                         MaterialPageRoute(
    //                           builder: (context) => VideoPlayer(_resourceSection),
    //                         ),
    //                       );
    //                     },
    //                     child:CachedNetworkImage(
    //                         imageUrl: _resourceSection.resourceAddress,
    //                         fit: BoxFit.cover,
    //                         placeholder: (context, url) => CircularProgressIndicator(),
    //                         errorWidget: (context, url, error) => Icon(Icons.error),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //            Container(
    //               height: _tileHeight,
    //               width: double.infinity,
    //               child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: <Widget>[
    //                     Flexible(
    //                       flex: 9,
    //                       child: Padding(
    //                         padding: const EdgeInsets.all(5.0),
    //                         child: Container(
    //                           height: 50.0,
    //                           width: double.infinity,
    //                           color: Colors.black38,
    //                           child: Column(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: <Widget>[
    //                               Text(
    //                                 "片名：${_resourceSection.sourceName}",
    //                                 style: authorStyle,
    //                                 maxLines: 1,
    //                                 overflow: TextOverflow.ellipsis,
    //                               ),
    //                               Divider(
    //                                 height: 5,
    //                                 color: Colors.white30,
    //                               ),
    //                               Text(
    //                                 "时长：${_resourceSection.duration}",
    //                                 style: authorStyle,
    //                                 maxLines: 1,
    //                                 overflow: TextOverflow.ellipsis,
    //                               ),
    //                               Text(
    //                                 "来源：${_resourceSection.source}",
    //                                 style: authorStyle,
    //                                 maxLines: 1,
    //                                 overflow: TextOverflow.ellipsis,
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     //likeIcon
    //                       likeIcon(isLiked ? Icons.favorite : Icons.favorite_border,
    //                         color: isLiked ? red : lightGrey,
    //                         size: 35,
    //                         padding: 15,
    //                         isOutLine: false, onPressed: () {
    //                           // setState(() {
    //                           //   print("${_resourceSectionList[index].resourceID}");
    //                             isLiked = !isLiked;
    //                           }),
    //                   ])),
    //           //     new Container(
    //           //       margin: EdgeInsets.only(top: 10), child:
    //           //       new Column(
    //           //         mainAxisAlignment: MainAxisAlignment.center,
    //           //          crossAxisAlignment: CrossAxisAlignment.start, 
    //           //          children: <Widget>[
    //           //             new Text("\$${this._resourceSection.sourceName}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    //           //             new Container(margin: EdgeInsets.only(top: 20, bottom: 10), child: new Text("${this._resourceSection.sourceName}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
    //           //             new Text("${this._resourceSection.source}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))
    //           //       ])
    //           // )
    //         ]);
    double height = MediaQuery.of(context).size.height/0.82;
    double fontSize = (height/50).round().toDouble();
    bool isLiked = false;
    return new  GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoPlayer(_resourceSection)));
        },
        child:
          new Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
          decoration: BoxDecoration(color:Color.fromRGBO(255,255,255,0.48), 
          borderRadius: BorderRadius.all(Radius.circular(10))),
          child:new Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          new Center(child: new Hero(tag: _resourceSection.sourceID,
          //         child:  Container(
          //         width: 200,
          //         height: 120,
          //         decoration: BoxDecoration(
          //             shape: BoxShape.rectangle,
          //             image: DecorationImage(
          //                 fit: BoxFit.cover,
          //                 image: NetworkImage(_resourceSection.resourceAddress)
          //             )
          //         ),
          //       ),
          // )
          // ),
          child:
           new Image.network(_resourceSection.resourceAddress, fit: BoxFit.cover, height: height * 0.20))),
          new Container(
            margin: EdgeInsets.all(5), 
            child:new Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              new Container(margin: EdgeInsets.only(top: 2, bottom: 2),
              child: new Text(
                this._resourceSection.sourceName,
                style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: fontSize * 0.65)
                )),
                new Container(
                  child:new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    new Text(this._resourceSection.duration.toString(), style: TextStyle(color: Colors.grey, fontSize: fontSize * 0.7)),
                    likeIcon(isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? red : Colors.grey,
                        size:  fontSize * 0.9,
                        isOutLine: false, onPressed: () {
                          // setState(() {
                          //   print("${_resourceSectionList[index].resourceID}");
                            isLiked = !isLiked;
                    }),
                  ])
                )
            ])
          )
        ])
          )
    );
  }
}