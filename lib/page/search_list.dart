import 'package:ciying/common/custom_app_bar.dart';
import 'package:ciying/page/resource_list.dart';
import 'package:ciying/util/hexColor.dart';
import 'package:ciying/widgets/SlideContainer.dart';
import 'package:ciying/widgets/UserDrawerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          backgroundColor:HexColor("#1C284E"),
          body: _SearchListBody(),
        ),
      );
}

class _SearchListBody extends StatefulWidget {
  @override
  _SearchListBodyState createState() => _SearchListBodyState();
}

class _SearchListBodyState extends State<_SearchListBody> with TickerProviderStateMixin {
  double position = 0.0;
  double height = 0.0;

  double get maxSlideDistance => MediaQuery.of(context).size.width * 0.9;

  final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();

  void onSlide(double position) {
    setState(() => this.position = position);
  }
  
  String firstButtonText = 'Take photo';
  String secondButtonText = 'Record video';
  double textSize = 20;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    height = MediaQuery.of(context).size.height - statusBarHeight;
    double widthBar = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),
      child: SlideStack(
        drawer: UserDrawerPage(),
        child: SlideContainer(
          key: _slideKey,
          child: Container(
            width: widthBar,
            height: height * (1 - position / 5),
            child: Column(
              children: <Widget>[
                CustomAppBar(
                  title: '词影',
                  height: kToolbarHeight * (1 - position / 5),
                  tapDrawer: () {
                    _slideKey.currentState.openOrClose();
                  },
                  isSearch:true,
                ),
                Expanded(
                 child: Stack(children: <Widget>[
                  // new CustomScrollView(
                  //   slivers: <Widget>[
                  //       new SliverToBoxAdapter(child:new getSearchBarUI()),
                  // ]),
                  getSearchBarUI(),
                ])
                )
              ],
            ),
          ),
          slideDirection: SlideDirection.left,
          onSlide: onSlide,
          drawerSize: maxSlideDistance,
          transform:
          Matrix4.translationValues(0.0, height * position / 10, 0.0),
        ),
      ),
    );
  }
}

class getSearchBarUI extends StatefulWidget {
 @override
  _getSearchBarUIState createState() => new _getSearchBarUIState();
}

class _getSearchBarUIState extends State<getSearchBarUI> {
    TextEditingController _searchEtController = TextEditingController();

  @override
  Widget build(BuildContext context){
    double widthUI = MediaQuery.of(context).size.width;
    return new Container(
     padding: const EdgeInsets.only( top: 150, bottom: 4),
     color: HexColor("#E5E7EB"),
     child: Column(
       children: <Widget>[
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        // fit: BoxFit.contain,
                        image: AssetImage('assets/images/logo.png')
                    )
                ),
              ),
               Text(
                "IYING",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#1C284E"),
                    // letterSpacing: 1,
                  ),
              ),
            ],
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         Padding(
          padding: const EdgeInsets.only(right: 16, top: 60, bottom: 8),
          child: Container(
            width: widthUI/1.25,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.white.withOpacity(0.9),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only( left: 16, right: 16, top: 4, bottom: 4),
              child: TextField(
                onChanged: (String txt) {
                  _searchEtController.text=txt;
                },
                style: const TextStyle(
                  fontSize: 18,
                ),
                cursorColor: HexColor("#1C284E"),
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: '请输入搜索内容...',
                ),
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp("[a-z]")),
                  // LengthLimitingTextInputFormatter(5)
                  ],
                  // 回车提交
                  onEditingComplete:() {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ResourceList(_searchEtController.text),
                        ),
                      );
                   },
              ),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only( top: 60, bottom: 8),
          child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
              color: Colors.white.withOpacity(0.9),
                  offset: const Offset(0, 2),
                  blurRadius: 12.0),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResourceList(_searchEtController.text),
                ),
               );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // child: Icon(Icons.search,
                //     size: 20,
                //     color:HexColor("#1C284E"),),
                child: Text(
                      "搜索", style: TextStyle(
                        color:HexColor("#1C284E"),
                      fontSize: 18
                    )
                )
              ),
            ),
          ),
        )
        )
       ]
      )
      ]
    )
    );
  }
}