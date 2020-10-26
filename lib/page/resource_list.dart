import 'package:CiYing/common/constants.dart';
import 'package:CiYing/models/image_list.dart';
import 'package:CiYing/models/image.dart' as DisplayImage;
import 'package:CiYing/page/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResourceList extends StatefulWidget {

  var isShow = false;
  final ImageList _images;
  final bool searchPerformed;

  ResourceList(this._images, {this.searchPerformed = false});
  @override
  _ResourceListState createState() => _ResourceListState();
}

class _ResourceListState extends State<ResourceList>with TickerProviderStateMixin {
  bool isLiked = true;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
       controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();

    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _getBuildWidget(context);

  Widget _getBuildWidget(BuildContext context) {
    Widget targetWidget;
    if (widget._images == null && widget.searchPerformed == true) {
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
    } else if (widget.searchPerformed == false) {
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

    List<DisplayImage.Image> displayImages = widget._images.images;
    TextStyle authorStyle = TextStyle(
      fontSize: 10,
      color: Colors.white,
      letterSpacing: 1,
    );

    // double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    final double _tileHeight = MediaQuery.of(context).size.height / 3;

    int noOfRows = 1;

    if (deviceWidth > 800)
      noOfRows = 5;
    else if (deviceWidth > 200) noOfRows = 2;
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
                child: Container(
                  height: _tileHeight,
                  width: double.infinity,
                  padding: const EdgeInsets.all(2.6),
                  child: Hero(
                    tag: '${displayImages[index].imageUrl}',
                    child: Material(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(14),
                      shadowColor: Colors.grey.withOpacity(0.5),
                      elevation: 24.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,
                              '/images/${widget._images.searchQuery}/$index');
                        },
                        child: Image.network(displayImages[index].imageUrl,
                            fit: BoxFit.cover),
                      ),
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
                                    style: authorStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Divider(
                                    height: 5,
                                    color: Colors.white30,
                                  ),
                                  Text(
                                    "时长：${displayImages[index].views}",
                                    style: authorStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "来源：${displayImages[index].views}",
                                    style: authorStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //likeIcon
                          likeIcon(isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? red : lightGrey,
                            size: 40,
                            padding: 15,
                            isOutLine: false, onPressed: () {
                              setState(() {
                                print("${displayImages[index].imageUrl}");
                                isLiked = !isLiked;
                              });
                          }),
                      ])),
            ],
          );
        },
      ),
    );
  }
}

void _flavModalBottomSheet(BuildContext context) {
  print("_flavModalBottomSheet");
}
