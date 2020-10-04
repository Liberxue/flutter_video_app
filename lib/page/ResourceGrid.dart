import 'package:CiYing/models/image_list.dart';
import 'package:CiYing/models/image.dart' as DisplayImage;
import 'package:flutter/material.dart';

class ResourceGrid extends StatelessWidget {
  final ImageList _images;
  final bool searchPerformed;
  ResourceGrid(this._images, {this.searchPerformed = false});

  Widget getBuildWidget(BuildContext context) {
    Widget targetWidget;

    if (_images == null && searchPerformed == true) {
      targetWidget = Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Something went wrong. Please try again.',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
      );
    } else if (searchPerformed == false) {
      targetWidget = Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '词影精准台词搜索 \n \n 搜索结果来自Spider爬行 \n \n 不存储任何内容，只提供信息检索服务。',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      targetWidget = buildImagesGrid(context);
    }

    return targetWidget;
  }

  Widget buildImagesGrid(BuildContext context) {
    List<DisplayImage.Image> displayImages = _images.images;
    TextStyle authorStyle =
        TextStyle(color: Colors.black54, fontFamily: 'Roboto', fontSize: 14.0);
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    final double _tileHeight = MediaQuery.of(context).size.height / 3;

    int noOfRows = 1;

    if (deviceWidth > 800)
      noOfRows = 5;
    else if (deviceWidth > 200) noOfRows = 3;
    return Expanded(
      child: GridView.builder(
        itemCount: displayImages.length,
        padding: EdgeInsets.all(2.0),
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: noOfRows),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              Container(
                height: _tileHeight,
                width: double.infinity,
                padding: const EdgeInsets.all(2.6),
                child: Hero(
                  tag: '${displayImages[index].imageUrl}',
                  child: Material(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(14),
                    shadowColor: Colors.grey.withOpacity(0.5),
                    elevation: 24.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/images/${_images.searchQuery}/$index');
                      },
                      child: Image.network(displayImages[index].imageUrl,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Container(
                  height: _tileHeight,
                  width: double.infinity,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50.0,
                              width: double.infinity,
                              color: Colors.black38,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "片名：${displayImages[index].photographer}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // Divider(
                                  //   height: 5,
                                  //   color: Colors.black87,
                                  // ),
                                  Text(
                                    "时长：${displayImages[index].views}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      letterSpacing: 1,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "来源：${displayImages[index].views}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      letterSpacing: 1,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: double.infinity, right: 20),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  bottom: double.infinity, right: 20),
                              height: 50.0,
                              width: 50.0,
                              color: Colors.black38,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ])),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBuildWidget(context);
  }
}
