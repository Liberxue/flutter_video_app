import 'dart:math';

import 'package:ciying/api/search/search_tags.dart';
import 'package:ciying/grpc/proto/common.pb.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/util/hexColor.dart';
import 'package:flutter/material.dart';

class SearchTags extends StatefulWidget {
  @override
  _SearchTagsState createState() => new _SearchTagsState();
}

class _SearchTagsState extends State<SearchTags> {
  List<String> searchTags = new List<String>();
  bool isLoading=true;
  @override
  void initState() {
    super.initState();
    loadSearchTagList();
  }

  Future loadSearchTagList() async{
      SearchTagRequest searchTagRequest = SearchTagRequest();
      searchTagRequest.searchTips = false;
      searchTagRequest.searchText = null;
      SearchTagResponse searchTagResponse =
      await SearchTagsApi.searchTagsAPIRequest(searchTagRequest);
      if(searchTagResponse.code!=ResponseCode.SUCCESSFUL){
        return null;
      }
      setState(() {
        searchTags=searchTagResponse.searchTags;
        isLoading=false;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 280, left: 30, right: 30),
        child: GridView.builder(
            itemCount: isLoading?this.searchTags.length:0,
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                //单个子Widget的水平最大宽度
                maxCrossAxisExtent: 160,
                //水平单个子Widget之间间距
                // mainAxisSpacing: .5,
                //垂直单个子Widget之间间距
                crossAxisSpacing: 2.5,
                // //子组件宽高长度比例
                childAspectRatio: 1.9),
            itemBuilder: (BuildContext context, int index) {
              return Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HexColor("#E5E6EA"),
                      ),
                      color: HexColor("#E4E5EA"),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Text(isLoading?this.searchTags[index]:"网络异常加载失败，请稍后重试",
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[10],
                        )),
                  )
                ],
              );
            }));
  }
}

Color randomColor() {
  return Color.fromARGB(255, Random().nextInt(256) + 0,
      Random().nextInt(256) + 0, Random().nextInt(256) + 0);
}
