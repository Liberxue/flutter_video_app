import 'package:ciying/components/rounded_input_field.dart';
import 'package:ciying/page/head_profile.dart';
import 'package:ciying/page/search_list.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _headerState createState() => _headerState();
}

class _headerState extends State<Header> {
  // TextEditingController searchQueryController = TextEditingController();

  // bool _isLoading = false;
  // bool _searchDone = false;
  // bool _searchHeaderShow = false;

  Future _performSearch() async {
    // final String query = searchQueryController.text;
    // ImageList images = await Storage.getImagesForSearch(query);
    setState(() {
      // _images = images;
      // _searchDone = true;
      // _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            // automaticallyImplyLeading: true, // hides leading widget
            // leading: Builder(builder: (BuildContext context) {
            //   return Container(
            //       child: new Center(
            //     child: IconButton(
            //       icon: Image.asset("assets/images/logo.png"),
            //       onPressed: () {
            //          Navigator.of(context).pushReplacement(MaterialPageRoute(
            //           builder: (context) => SearchList(),
            //             ));                
            //       },
            //     ),
            //   ));
            // }),
            elevation: 1.2,
            backgroundColor: Colors.white,
            actions: <Widget>[
              // if (_searchHeaderShow)
                Container(
                  width: 300,
                  height: 60,
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
        );
  }
}
