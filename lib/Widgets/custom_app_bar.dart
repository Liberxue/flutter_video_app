import 'package:ciying/page/Search/search.dart';
import 'package:ciying/Utils/hexColor.dart';
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
      paddingTop = 15;
    } else {
      paddingTop = 40;
    }
    return Container(
      padding: EdgeInsets.only(left: 10, top: paddingTop, right: 10),
      height: 80,
      color: HexColor("#fff"),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: tapDrawer,
              child: Icon(
                Icons.dehaze,
                color: Colors.grey,
              ),
            ),
            if (!isSearch)
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                color: Colors.white10,
                child: Text(
                  title,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
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
