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
    setState(() {
      _images = images;
      _searchDone = true;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: TextField(
          cursorWidth: 1.0,
          cursorRadius: Radius.circular(5.0),
          controller: searchQueryController,
          onEditingComplete: () async {
            setState(() {
              _isLoading = true;
              _searchHeaderShow = true;
            });
            await _performSearch();
          },
          maxLines: 2,
          decoration: InputDecoration(
              labelText: '搜索',
              labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
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
