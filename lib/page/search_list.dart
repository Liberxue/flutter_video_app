import 'package:CiYing/components/rounded_input_field.dart';
import 'package:CiYing/page/resource_list.dart';
import 'package:CiYing/page/head_profile.dart';
import 'package:flutter/material.dart';
import 'package:CiYing/models/image_list.dart';
import 'package:CiYing/util/network.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
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
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            automaticallyImplyLeading: true, // hides leading widget
            leading: Builder(builder: (BuildContext context) {
              return Container(
                  child: new Center(
                child: IconButton(
                  icon: Image.asset("assets/images/logo.png"),
                  onPressed: () {
                      Navigator.pop(context);
                    }//打开抽屉drawer
                ),
              ));
            }),
            elevation: 1.2,
            backgroundColor: Colors.white,
            actions: <Widget>[
              if (_searchHeaderShow)
                Container(
                  padding: const EdgeInsets.only(left: 8.0, right: 2.0),
                  width: 280,
                  height: 50,
                  child: RoundedInputField(
                    icon: Icons.search,
                    hintText: "搜索",
                    onChanged: (value) {
                      _performSearch();
                    },
                  ),
                ),
              UserHeaderProfile(),
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
              ResourceList(_images, searchPerformed: _searchDone)
          ],
        ));
  }
}
