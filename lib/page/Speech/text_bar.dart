import 'dart:ui';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/Utils/store.dart';
import 'package:ciying/Widgets/dialog.dart';
import 'package:ciying/api/speech/speech.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/gateWay.pb.dart';
import 'package:ciying/page/Speech/speech_language.dart';
import 'package:ciying/page/User/Login_out.dart';
import 'package:ciying/page/User/UserCache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:just_audio/just_audio.dart';

class TextInputBarUI extends StatefulWidget {
  @override
  _TextInputBarUIState createState() => new _TextInputBarUIState();
}

class _TextInputBarUIState extends State<TextInputBarUI>
    with SingleTickerProviderStateMixin {
  TextEditingController _searchEtController = TextEditingController();
  TabController _controller;
  List tabs = ["中文", "英文"];

  final player = AudioPlayer();

  String _locaPath = "";
  String _url = "";
  bool _isLoading = false;
  bool _isLogin = false;
  UserInfo userInfo;
  @override
  void initState() {
    _controller = new TabController(length: 2, vsync: this);
    super.initState();
    _getLoginState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
  //   //如果build中没有依赖InheritedWidget，则此回调不会被调用。
  //   print("Dependencies change");
  // }

  _getLoginState() async {
    var userInfo = await loadUserCache();
    if (userInfo == null || _isLogin) {
      this._isLogin = false;
      this._isLoading = false;
    } else {
      setState(() {
        this.userInfo = userInfo;
        this._isLogin = true;
        this._isLoading = false;
      });
    }
  }

  Future<void> shareFile(String path) async {
    await FlutterShare.share(
        title: '词影-配音无损音频文件',
        text: '词影-配音无损音频文件',
        linkUrl: path,
        chooserTitle: '词影-配音无损音频文件');
  }

  @override
  Future<void> dispose() async {
    _searchEtController.dispose();
    await player.stop();
// Permanently release decoders/resources used by the player.
    await player.dispose();
    super.dispose();
  }

  int _searchWordCount = 500;
  getGetSpeechFileResponse _getSpeechFileResponse;

  Future<String> _getSpeechResult() async {
    String speechLang = await Cache.getCache("speechLang");
    String name = await Cache.getCache("name");
    String defaultRate = await Cache.getCache("speechRate");
    String defaultPitch = await Cache.getCache("speechPitch");

// grpc request
    GetSpeechFileRequest getSpeechFileRequest = new GetSpeechFileRequest();
    getSpeechFileRequest.text = _searchEtController.text;
    getSpeechFileRequest.lang = speechLang;
    getSpeechFileRequest.name = name;
    getSpeechFileRequest.rate =
        ((double.parse(defaultRate) - 1) * 100).toStringAsFixed(0) + "%";
    getSpeechFileRequest.pitch =
        ((double.parse(defaultPitch) / 2 - 0.5) * 100).toStringAsFixed(0) + "%";
    _getSpeechFileResponse =
        await SpeechApi.getSpeechFileApiRequest(getSpeechFileRequest);
    if (_getSpeechFileResponse == null) {
      dialogShow("请求超时，请检查网络");
      return "";
    }
    if (_getSpeechFileResponse.code == ResponseCode.SUCCESSFUL) {
      return _getSpeechFileResponse.filePath;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);
    // double widthUI = MediaQuery.of(context).size.width;
    double heightUI = MediaQuery.of(context).size.height;
    return ListView(
      padding: const EdgeInsets.only(top: 45),
      children: <Widget>[
        Container(
          height: heightUI * 0.05,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: new BoxDecoration(
            color: HexColor("#F8FAFB"),
          ),
          child: TabBar(
              controller: _controller,
              indicatorWeight: 1.0,
              labelColor: HexColor("#2B2F4F"),
              unselectedLabelColor: HexColor("#2B2F4F").withOpacity(0.4),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: HexColor("#EAF0F1"),
              ),
              tabs: tabs.map((e) => Tab(text: e)).toList()),
        ),
        Container(
          // width: MediaQuery.of(context).size.width,
          height: heightUI * 0.63,
          child: new TabBarView(
            controller: _controller,
            children: tabs.map((e) {
              return new Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: heightUI * 0.38,
                      decoration: BoxDecoration(
                        color: HexColor("#EAF0F1"),
                        // borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: HexColor("#EAF0F1").withOpacity(0.2),
                            offset: const Offset(0, 2),
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (String txt) {
                          _searchEtController.text = txt;
                        },
                        // 最大换行数
                        maxLines: 50,
                        minLines: 1,
                        inputFormatters: [
                          // FilteringTextInputFormatter(
                          //   RegExp("[a-zA-Z’',.?!~;《》\r|\n|\\s]+[ ]*"),
                          //   allow: true,
                          // ),
                          LengthLimitingTextInputFormatter(_searchWordCount)
                        ],
                        // 键盘样式
                        textInputAction: TextInputAction.go,
                        //设置键盘的类型
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        cursorColor: Color(0xFF4A6572),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: e == "中文"
                              ? '请输入或者粘贴文本...'
                              : "请输入英文文本或者粘贴英文文本...(其他语言文本会被忽略哦～)",
                          // filled: true,
                          // fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          isDense: true,
                        ),
                      ),
                    ),
                    //
                    // 发音
                    SpeechLanguage(tabAction: "$e"),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        //按钮位置
        AnimatedOpacity(
          duration: const Duration(milliseconds: 1500),
          opacity: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    // Speech speech = Provider.of<Speech>(context).speech();
                    //隐藏键盘
                    // SystemChannels.textInput.invokeMethod('TextInput.hide');
                    // //输入框失去焦点
                    // searchInputFieldNode.unfocus();
                    if (!this._isLogin) {
                      dialogShow("请先登陆 \n 试听");
                      return loginOut(context);
                    }
                    if (_searchEtController.text.length > 0) {
                      var yyDialog = progressDialogBody();
                      yyDialog.show();
                      var result = await _getSpeechResult();
                      if (result.length < 1) {
                        yyDialog?.dismiss();
                        dialogShow("抱歉 \n 生成文件失败,\n 请稍后重试或联系客服");
                      }
                      if (result.length > 0) {
                        yyDialog?.dismiss();
                        print(result);
                        setState(() {
                          _url = result;
                        });
                        try {
                          await player.setUrl(_url);
                          player
                              .play(); // Usually you don't want to wait for playback to finish.
                        } catch (t) {
                          yyDialog?.dismiss();
                          dialogShow("试听遇到点问题,\n 请重试");
                        }
                      }
                    } else {
                      dialogShow("内容为空，\n 无效操作");
                    }
                  },
                  // padding: const EdgeInsets.symmetric(horizontal: 24),
                  color: Color(0xFF4A6572), //
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.multitrack_audio, color: Colors.white),
                      Text("    试听",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      SizedBox(
                        width: 10,
                        height: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (!this._isLogin) {
                      dialogShow("请先登陆 下载");
                      return loginOut(context);
                    }
                    if (_searchEtController.text.length > 0) {
                      var yyDialog = progressDialogBody();
                      if (_url.length < 0) {
                        yyDialog.show();
                        var result = await _getSpeechResult();
                        setState(() {
                          _url = result;
                        });
                        yyDialog?.dismiss();
                        if (_url.length > 0 && _url != null) {
                          return shareFile(_url);
                        }
                        return dialogShow("请试听 \n确认");
                      }
                      if (_url.length > 0 && _url != null) {
                        return shareFile(_url);
                      }
                      return dialogShow("请试听 \n 确认");
                    } else {
                      return dialogShow("内容为空，\n 无效操作");
                    }
                  },
                  color: HexColor("#252C4E"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.cloud_download_outlined, color: Colors.white),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 30,
                        ),
                        // child: Text(" 6积分",
                        //     textAlign: TextAlign.right,
                        //     style: TextStyle(
                        //         fontSize: 14,
                        //         decoration: TextDecoration.lineThrough,
                        //         decorationColor: Colors.red,
                        //         color: Colors.red[600])),
                      ),
                      // Text("0 ",
                      //     textAlign: TextAlign.right,
                      //     style: TextStyle(fontSize: 14, color: Colors.yellow)),
                      Text("下载",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      SizedBox(
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

YYDialog progressDialogBody() {
  return YYDialog().build()
    ..width = 200
    ..borderRadius = 4.0
    ..barrierDismissible = false // 是否点击弹出外部消失
    ..circularProgress(
      padding: EdgeInsets.all(24.0),
      valueColor: Colors.orange[500],
    )
    ..text(
      padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 12.0),
      text: "正在拟音,请稍后...",
      alignment: Alignment.center,
      color: Colors.orange[500],
      fontSize: 14.0,
    );
  // ..show();
}
