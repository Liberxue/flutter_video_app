import 'package:CiYing/models/image_list.dart';
import 'package:CiYing/util/network.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  // final bool _isLoading;
  // final ImageList _images;
  // final bool _searchDone;
  // final bool _searchHeaderShow;
  // Header(
  //     this._isLoading, this._images, this._searchDone, this._searchHeaderShow);
  const Header(
    Key key,
  ) : super(key: key);
  @override
  _headerState createState() => _headerState();
}

class _headerState extends State<Header> {
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
    return Container(
        // padding: EdgeInsets.all(20.0),
        // margin: EdgeInsets.only(bottom: 10),
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
                  fontSize: 14.0),
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
                Radius.circular(14.0),
              ))),
        ));
  }
}
