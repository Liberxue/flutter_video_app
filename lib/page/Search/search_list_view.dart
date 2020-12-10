import 'package:ciying/grpc/proto/search.pb.dart';
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
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - widget.animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (BuildContext context) {
                    return VideoPlayer(
                        widget.searchText, widget.resourceSection);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 2,
                              child: Image.network(
                                widget.resourceSection.resourceAddress,
                                fit: BoxFit.cover,
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
                                              widget.resourceSection.transcript,
                                              textAlign: TextAlign.left,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(0xFF17262A),
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
                                                    '视频来源：${widget.resourceSection.sourceName}',
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
                                          '${widget.resourceSection.duration} 秒',
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
                          top: 8,
                          right: 8,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
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
