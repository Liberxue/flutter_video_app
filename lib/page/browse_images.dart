import 'package:CiYing/components/rounded_input_field.dart';
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
  bool _searchHeaderShow = false;

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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            automaticallyImplyLeading: true, // hides leading widget
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset("assets/images/logo.png"),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                tooltip: MaterialLocalizations.of(context)
                    .openAppDrawerTooltip, //打开抽屉drawer
              );
            }),
            elevation: 1.5,
            backgroundColor: Colors.white,
            actions: <Widget>[
              if (_searchHeaderShow)
                RoundedInputField(
                  icon: Icons.search,
                  hintText: "搜索",
                  onChanged: (value) {},
                ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars0.githubusercontent.com/u/5831248?s=460&u=cfea690871e82c78cd60c9fde9a086e6da6b6d3c&v=4"),
                  foregroundColor: Colors.black,
                  radius: 30.0,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (!_searchHeaderShow)
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
                        _isLoading = true;
                        _searchHeaderShow = true;
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
                              _isLoading = true;
                              _searchHeaderShow = true;
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
