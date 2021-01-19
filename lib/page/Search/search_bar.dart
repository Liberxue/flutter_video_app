import 'package:ciying/common/AppConfig.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/page/Search/search_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

class getSearchBarUI extends StatefulWidget {
  @override
  _getSearchBarUIState createState() => new _getSearchBarUIState();
}

class _getSearchBarUIState extends State<getSearchBarUI> {
  TextEditingController _searchEtController = TextEditingController();

  @override
  void dispose() {
    _searchEtController.dispose();
    super.dispose();
  }

  // search Validate start
  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);
    double widthUI = MediaQuery.of(context).size.width;
    return new Container(
        padding: const EdgeInsets.only(top: 80, bottom: 4),
        color: AppDesignCourseAppTheme.BackgroundColor,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/logo.png'))),
              ),
              Text(
                "IYING",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: HexColor("#1C284E"),
                  letterSpacing: 1,
                ),
              ),
              Text(
                " 🎉 中英文",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[300],
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 0, top: 60, bottom: 8),
                  child: Container(
                    width: widthUI / 1.35,
                    height: 60,
                    decoration: BoxDecoration(
                      color: HexColor("#E5E6EA"),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: HexColor("#E5E6EA"),
                            offset: const Offset(0, 2),
                            blurRadius: 12.0),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2, right: 2, top: 4, bottom: 4),
                      child: TextField(
                        onChanged: (String txt) {
                          _searchEtController.text = txt;
                        },
                        // 键盘样式
                        textInputAction: TextInputAction.search,
                        //设置键盘的类型
                        keyboardType: TextInputType.text,
                        // inputFormatters: [
                        //   FilteringTextInputFormatter(
                        //     RegExp("[a-zA-Z’']+[ ]*"),
                        //     allow: true,
                        //   ),
                        //   LengthLimitingTextInputFormatter(50)
                        // ],
                        inputFormatters: <TextInputFormatter>[
                          // FilteringTextInputFormatter.allow(
                          //  // RegExp("[a-zA-Z⌴’']+[ ]*"),
                          // ),
                          LengthLimitingTextInputFormatter(50)
                        ],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        cursorColor: HexColor("#1C284E"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          border: InputBorder.none,
                          hintText: '请输入感兴趣的台词...',
                        ),
                        // 回车提交
                        onEditingComplete: () {
                          // if (WordCount()
                          //         .getWordCount(_searchEtController.text) >=
                          //     _searchWordCount) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                SearchList(_searchEtController.text),
                          ));
                          // } else {
                          //   dialogShow("单词不能少于2个哦");
                          // }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 9),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: HexColor("#252C4E"),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor("#E5E6EA"),
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
                            //   if (WordCount()
                            //           .getWordCount(_searchEtController.text) >=
                            //       _searchWordCount) {
                            FocusScope.of(context).requestFocus(FocusNode());

                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) =>
                                    SearchList(_searchEtController.text)));
                            //   } else {
                            //     dialogShow("不能少于2个词哦");
                            //   }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.search,
                              size: 20,
                              color: HexColor("#E5E6EA"),
                            ),
                          ),
                        ),
                      ),
                    )),
              ])
        ]));
  }
}
