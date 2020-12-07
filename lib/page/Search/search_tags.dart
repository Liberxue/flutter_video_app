import 'package:ciying/api/search/search_tags.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/page/Search/search_list.dart';
import 'package:flutter/material.dart';

class SearchTags extends StatefulWidget {
  @override
  _SearchTagsState createState() => new _SearchTagsState();
}

class _SearchTagsState extends State<SearchTags> {
  List<String> searchTags = new List<String>();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadSearchTagList();
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
        searchTags = searchTagResponse.searchTags;
        isLoading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(top: 330, left: 30, right: 30),
          child: Text("猜你喜欢～点击标签即刻体验: ",
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[10],
              )),
        ),
        // child: new RaisedButton(
        //   onPressed: () {},
        //   child: new Text("换一批 ～ ",
        //       style: TextStyle(color: Colors.white, fontSize: 14)),
        //   color: Colors.grey[10],
        // )),
        new Container(
            padding: EdgeInsets.only(top: 325, left: 30, right: 30),
            child: GridView.builder(
                itemCount: isLoading || this.searchTags != null
                    ? this.searchTags.length
                    : 0,
                gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                    //单个子Widget的水平最大宽度
                    maxCrossAxisExtent: 200,
                    //水平单个子Widget之间间距
                    // mainAxisSpacing: 1.5,
                    //垂直单个子Widget之间间距
                    crossAxisSpacing: 1.5,
                    // //子组件宽高长度比例
                    childAspectRatio: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return Wrap(
                    // spacing: 2.0, // 主轴(水平)方向间距
                    // runSpacing: 2.0, // 纵轴（垂直）方向间距
                    direction: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  SearchList(this.searchTags[index]),
                            ));
                          },
                          child: Container(
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
                            child: Text(
                                !isLoading
                                    ? this.searchTags[index]
                                    : "网络异常加载失败，请稍后重试",
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[10],
                                )),
                          ))
                    ],
                  );
                }))
      ],
    );
  }
}
