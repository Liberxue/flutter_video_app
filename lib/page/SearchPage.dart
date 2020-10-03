import 'package:CiYing/util/ScreenUtil.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchQueryController = TextEditingController();
    bool _isLoading = false;
    // ResourceList _resource;
    bool _searchDone = false;

    Future _performSearch() async {
      final String query = searchQueryController.text;
      // ResourceList resourceList = await Storage.getResourceForSearch(query);
      // print(ResourceList.resourceList[0].resourceListUrl);
      // setState(() {
      //   _resource = resource;
      //   _searchDone = true;
      //   _isLoading = false;
      // });
    }

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
        child: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                '词影 ・ 视频内容精准识别搜索',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 24.0),
              ),
            ),
            SizedBox(
              height: ScreenUtil.statusBarHeight + 40.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.only(top: 32.0),
                    width: 800,
                    child: TextField(
                      controller: searchQueryController,
                      // maxLines: 0,
                      decoration: InputDecoration(
                          labelText: '输入识别搜索内容',
                          labelStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontSize: 12.0),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () async {
                              // setState(() {
                              //   _isLoading = true;
                              // });
                              await _performSearch();
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.0)))),
                    )),
                if (_isLoading)
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 45.0, horizontal: 50.0),
                      child: SizedBox(
                          height: 2.0,
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                          )))
                // else
                // ResourceGrid(_resource, searchPerformed: _searchDone)
              ],
            ),
            SizedBox(
              height: ScreenUtil.statusBarHeight / 2.0,
            ),
            Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, top: 10),
                  child: RaisedButton(
                    elevation: 0.0,
                    color: Colors.black38.withOpacity(0.1),
                    onPressed: () {},
                    child: Text(
                      "词影云",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black54,
                          fontFamily: 'arial'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: RaisedButton(
                    elevation: 0.0,
                    color: Colors.black26.withOpacity(0.1),
                    onPressed: () {},
                    child: Text(
                      "自定义情感",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 15.0,
                          color: Colors.black54,
                          fontFamily: 'arial'),
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    ));
  }
}
