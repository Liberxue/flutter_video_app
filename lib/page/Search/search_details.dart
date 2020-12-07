import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Video/VideoPlayer.dart';
import 'package:ciying/page/Favorites/favoritesIcon.dart';
import 'package:flutter/material.dart';

typedef StringValue = String Function(String);

class SearchDetails extends StatefulWidget {
  final String searchText;
  final ResourceSection _resourceSection;

  SearchDetails(this.searchText, this._resourceSection);

  @override
  _SearchDetailsState createState() => new _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double fontSize = (height / 50).round().toDouble();
    print(widget._resourceSection.resourceID);
    return new InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  new VideoPlayer(widget.searchText, widget._resourceSection)));
        },
        child: new Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xfff2f2f2),
            ),
            margin: EdgeInsets.all(5),
            child: new Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      fadeInCurve: Curves.easeIn,
                      alignment: Alignment.center,
                      imageUrl: widget._resourceSection.resourceAddress,
                      fit: BoxFit.cover,
                      width: 230,
                      height: 128,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(1),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: new Text(
                      widget._resourceSection.sourceName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: fontSize * 0.8),
                    ),
                  ),
                  new Container(
                      margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                                "时长:" +
                                    widget._resourceSection.duration
                                        .toString() +
                                    "秒",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: fontSize * 0.8)),
                            favoritesIcon(
                              widget._resourceSection.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: widget._resourceSection.isFavorite
                                  ? Colors.red
                                  : Colors.grey,
                              size: fontSize * 1.2,
                              isOutLine: false,
                              onPressed: () {
                                setState(() {
                                  widget._resourceSection.isFavorite =
                                      !widget._resourceSection.isFavorite;
                                });
                                // first update cache isFavorite status
                                // after  update caceh isFavorite remote  status; mark ~~~

                                // updateFavoriteStatus().updateIsFavorite(
                                //   widget._resourceSection.isFavorite,
                                //   widget._resourceSection.resourceID,
                                // );
                              },
                              resourceId: widget._resourceSection.resourceID,
                            ),
                          ]))
                ])));
  }
}
