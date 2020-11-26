import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Video/VideoPlayer.dart';
import 'package:ciying/page/Favorites/favoritesIcon.dart';
import 'package:flutter/material.dart';

typedef StringValue = String Function(String);

class SearchDetails extends StatelessWidget {
  final String searchText;
  final ResourceSection _resourceSection;

  SearchDetails(this.searchText, this._resourceSection);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double fontSize = (height / 50).round().toDouble();
    bool isFavorite = false;

    return new InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VideoPlayer(searchText, _resourceSection)));
        },
        child: new Container(
            child: new Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              new Center(
                  child: new Hero(
                tag: _resourceSection.sourceID,
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: _resourceSection.resourceAddress,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              )),
              new Container(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    new Container(
                        margin: EdgeInsets.only(top: 5),
                        child: new Text(this._resourceSection.sourceName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: fontSize * 0.65))),
                    new Container(
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          new Text(this._resourceSection.duration.toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: fontSize * 0.7)),
                          favoritesIcon(
                            this._resourceSection.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: this._resourceSection.isFavorite
                                ? Colors.red
                                : Colors.grey,
                            size: fontSize * 0.9,
                            isOutLine: false,
                            onPressed: () {
                              // setState(() {
                              isFavorite = !isFavorite;
                              // FavoritesModels.favoriteAction(null);
                            },
                            resourceId: this._resourceSection.resourceID,
                          ),
                        ]))
                  ]))
            ])));
  }
}
