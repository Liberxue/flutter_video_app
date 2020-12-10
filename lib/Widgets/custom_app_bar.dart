import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/page/Search/search.dart';
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: tapDrawer,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.dehaze),
                  ),
                ),
              ),
            ),
            if (!isSearch)
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            if (!isSearch)
              Container(
                width: AppBar().preferredSize.height + 40,
                height: AppBar().preferredSize.height,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // Material(
                    //   color: Colors.transparent,
                    //   child: InkWell(
                    //     borderRadius: const BorderRadius.all(
                    //       Radius.circular(32.0),
                    //     ),
                    //     onTap: () {},
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Icon(Icons.favorite_border),
                    //     ),
                    //   ),
                    // ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.search_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
