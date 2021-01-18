import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/Utils/response_code_enum.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/models/router._arg.dart';
import 'package:ciying/page/Video/VideoPlayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchlListView extends StatefulWidget {
  const SearchlListView(this.resourceSection, this.searchText,
      this.animationController, this.animation, this.callback);

  final VoidCallback callback;
  final String searchText;
  final ResourceSection resourceSection;
  final AnimationController animationController;
  final Animation<dynamic> animation;
  @override
  _SearchlListViewState createState() => new _SearchlListViewState();
}

class _SearchlListViewState extends State<SearchlListView> {
  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - widget.animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 5, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => VideoPlayer(
                              widget.searchText, widget.resourceSection)));

                  // Navigator.of(context).push(CupertinoPageRoute(
                  //     builder: (context) => VideoPlayer(
                  //         widget.searchText, widget.resourceSection)));

                  // Navigator.pushNamed(
                  //   context,
                  //   "videoPlay",
                  //   arguments: new VideoPlayArguments(
                  //     widget.searchText,
                  //     widget.resourceSection,
                  //   ),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 2,
                              // child: Image.network(
                              //   widget.resourceSection.resourceAddress,
                              //   fit: BoxFit.cover,
                              // ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.resourceSection.resourceAddress,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.white, BlendMode.colorBurn)),
                                  ),
                                ),
                                // placeholder: (context, url) =>
                                //     CircularProgressIndicator(),

                                // errorWidget: (context, url, error) =>
                                //     Icon(Icons.error),
                                // errorWidget: (context, url, e) => Center(
                                //   // print("dsddss"),
                                //   child: Text(
                                //     '当前资源请求错误，请点击重试',
                                //     style: TextStyle(color: Colors.red),
                                //     textDirection: TextDirection.ltr,
                                //   ),
                                // ),
                                errorWidget: (context, url, error) =>
                                    GestureDetector(
                                  onTap: () => print("上报错误～～～～～～"),
                                  child: Text(
                                    '当前资源请求错误，请点击重试',
                                    style: TextStyle(color: Colors.red),
                                    textDirection: TextDirection.ltr,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 8, bottom: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '${widget.resourceSection.transcript}',
                                              textAlign: TextAlign.left,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Color(0xFF17262A),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              '中文:${widget.resourceSection.chinsesTranScript}',
                                              textAlign: TextAlign.left,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Color(0xFF17262A)
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                // Text(
                                                //   "ewewew",
                                                //   maxLines: 1,
                                                //   overflow:
                                                //       TextOverflow.ellipsis,
                                                //   style: TextStyle(
                                                //       fontSize: 14,
                                                //       color: Colors.grey
                                                //           .withOpacity(0.8)),
                                                // ),
                                                Icon(Icons.video_call,
                                                    size: 20,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '素材来源：${widget.resourceSection.sourceName}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey
                                                            .withOpacity(0.8)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Row(
                                                children: <Widget>[
                                                  // SmoothStarRating(
                                                  //   allowHalfRating: true,
                                                  //   starCount: 5,
                                                  //   rating:
                                                  //       resourceSection.rating,
                                                  //   size: 20,
                                                  //   color: Colors.orange,
                                                  //   borderColor: Colors.white,
                                                  // ),
                                                  Icon(Icons.video_label,
                                                      size: 16,
                                                      color: Colors.grey
                                                          .withOpacity(0.8)),
                                                  const SizedBox(
                                                    width: 4,
                                                    height: 16,
                                                  ),
                                                  Text(
                                                    '情感分析：${widget.resourceSection.emotionCode}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey
                                                            .withOpacity(0.8)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Row(
                                                children: <Widget>[
                                                  // SmoothStarRating(
                                                  //   allowHalfRating: true,
                                                  //   starCount: 5,
                                                  //   rating:
                                                  //       resourceSection.rating,
                                                  //   size: 20,
                                                  //   color: Colors.orange,
                                                  //   borderColor: Colors.white,
                                                  // ),
                                                  Icon(Icons.video_label,
                                                      size: 16,
                                                      color: Colors.grey
                                                          .withOpacity(0.8)),
                                                  const SizedBox(
                                                    width: 4,
                                                    height: 16,
                                                  ),
                                                  Text(
                                                    '人物识别：${widget.resourceSection.emotionCode}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey
                                                            .withOpacity(0.8)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, top: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          widget.resourceSection.duration
                                                  .toStringAsFixed(2) +
                                              '秒',
                                          textAlign: TextAlign.right,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Color(0xFF17262A),
                                          ),
                                        ),
                                        // Text(
                                        //   '/per night',
                                        //   style: TextStyle(
                                        //       fontSize: 14,
                                        //       color:
                                        //           Colors.grey.withOpacity(0.8)),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0.1,
                          right: 0.1,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(32.0)),
                                ),
                                child: new Transform(
                                  alignment: Alignment.topCenter,
                                  transform: Matrix4.translationValues(
                                      0.9, 0.9, 0.3), //沿Y轴倾斜0.3弧度
                                  // transform: new Matrix4.skewY(0.9),
                                  child: new Container(
                                    padding: const EdgeInsets.all(12.0),
                                    color: HexColor("#252C4E").withOpacity(0.4),
                                    child: new Transform(
                                      alignment: Alignment.topCenter,
                                      transform: new Matrix4.skewY(0.01),
                                      child: Text(
                                        "${videoTypeEnum(widget.resourceSection.videoType)}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          letterSpacing: 0.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
