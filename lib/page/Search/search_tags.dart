import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/api/search/search_tags.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Search/search_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTags extends StatefulWidget {
  @override
  _SearchTagsState createState() => new _SearchTagsState();
}

class _SearchTagsState extends State<SearchTags> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  List<Tags> searchTags = new List<Tags>();
  bool isLoading = true;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    loadSearchTagList();
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Future loadSearchTagList() async {
    SearchTagRequest searchTagRequest = SearchTagRequest();
    searchTagRequest.searchTips = false;
    searchTagRequest.searchText = "";
    SearchTagResponse searchTagResponse =
        await SearchTagsApi.searchTagsAPIRequest(searchTagRequest);
    if (searchTagResponse.code != ResponseCode.SUCCESSFUL)
      setState(() {
        searchTags = null;
        isLoading = true;
      });
    else
      setState(() {
        searchTags = searchTagResponse.tags;
        isLoading = false;
      });
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 12, left: 28),
            child: Text(
              "抖音热搜:",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 18,
                letterSpacing: 0.27,
                color: HexColor("#252C4E"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          new Container(
            height: 120,
            width: double.infinity,
            child: FutureBuilder<bool>(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 0, right: 16, left: 16),
                    itemCount: searchTags.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final int count =
                          searchTags.length > 10 ? 10 : searchTags.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: animationController,
                                  curve: Interval((1 / count) * index, 1.0,
                                      curve: Curves.fastOutSlowIn)));
                      animationController.forward();

                      return CategoryView(
                        searchTag: searchTags[index],
                        animation: animation,
                        animationController: animationController,
                        callback: () {
                          // widget.callBack();
                        },
                      );
                    },
                  );
                }),
          ),
        ]);
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key key,
      this.searchTag,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Tags searchTag;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.white,
              onTap: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (BuildContext context) {
                  return SearchList(searchTag.tagKey);
                }));
              },
              child: SizedBox(
                width: 280,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 48,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  const SizedBox(
                                    width: 48 + 24.0,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text(
                                              '英语怎么表达 \n "${searchTag.tagValue}"',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                                letterSpacing: 0.27,
                                                color: Color(0xFF17262A),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5, bottom: 24, left: 6),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                // child: Image.asset("assets/images/tags/7.png"),
                                child: Icon(
                                  Icons.help_outline_rounded,
                                  color: Color(0xFFEDF0F9),
                                  size: 58,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
