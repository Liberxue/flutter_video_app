import 'package:ciying/page/search_list.dart';
import 'package:ciying/util/hexColor.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback tapDrawer;
  final double height;
  final bool isSearch;

  const CustomAppBar(
      {Key key, this.title, this.tapDrawer, this.height, this.isSearch = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Platform.isIOS 刘海屏。。。。。
    double paddingTop;
    if (MediaQuery.of(context).padding.top == null ||
        MediaQuery.of(context).padding.top == 0) {
      paddingTop = 30;
    } else {
      paddingTop = 50;
    }
    return Container(
      padding: EdgeInsets.only(top: paddingTop),
      color: HexColor("#E5E7EB"),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: tapDrawer,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.dehaze,
                  color: Colors.grey,
                ),
              ),
            ),
            if (!isSearch)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
          ]),
    );
  }
}
