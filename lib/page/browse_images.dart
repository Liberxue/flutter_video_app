import 'package:CiYing/common/constants.dart';
import 'package:CiYing/page/ResourceGrid.dart';
import 'package:flutter/material.dart';
import 'package:CiYing/models/image_list.dart';
import 'package:CiYing/util/network.dart';

class BrowseImages extends StatefulWidget {
  @override
  _BrowseImagesState createState() => _BrowseImagesState();
}

class _BrowseImagesState extends State<BrowseImages> {
  TextEditingController searchQueryController = TextEditingController();

  bool _isLoading = false;
  ImageList _images;
  bool _searchDone = false;
  double searchTop = 300.0;
  double searchwidth = 650.0;

  Future _performSearch() async {
    final String query = searchQueryController.text;
    ImageList images = await Storage.getImagesForSearch(query);

    print(images.images[0].imageUrl);

    setState(() {
      _images = images;
      _searchDone = true;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            // automaticallyImplyLeading: true, // hides leading widget
            title: Text(
              APPNAME + "搜索",
              style: TextStyle(fontSize: 20, height: 2, color: Colors.black45),
            ),
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset("assets/images/logo.png"),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context)
                    .openAppDrawerTooltip, //打开抽屉drawer
              );
            }),
            elevation: 1.5,
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.black,
                  onPressed: () {}),
              Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: RaisedButton(
                  elevation: 0.5,
                  color: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    '登录',
                    style: TextStyle(
                        fontFamily: 'arial',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                child: TextField(
                  cursorWidth: 2.0,
                  cursorRadius: Radius.circular(5.0),
                  controller: searchQueryController,
                  onEditingComplete: () async {
                    setState(() {
                      if (searchTop <= 300.0 && searchwidth <= 900)
                        searchTop -= 300;
                      searchwidth += deviceWidth;
                      _isLoading = true;
                    });
                    await _performSearch();
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: '搜索',
                      labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 12.0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          setState(() {
                            if (searchTop <= 300.0 && searchwidth <= 900)
                              searchTop -= 300;
                            searchwidth += deviceWidth;
                            _isLoading = true;
                          });
                          await _performSearch();
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(24.0),
                      ))),
                )),
            if (_isLoading)
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 45.0, horizontal: 50.0),
                  child: SizedBox(
                      height: 2.0,
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      )))
            else
              ResourceGrid(_images, searchPerformed: _searchDone)
          ],
        ));
  }
}
