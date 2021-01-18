import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void userPrivacyAgreementShowAlertDialog(BuildContext context) {
  showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          // title: new Text('用户隐私协议'),
          //可滑动
          content: InAppWebView(
            initialUrl:
                "https://www.yuque.com/docs/share/1f37dfda-4890-476c-ba41-6599f77f2149?# 《词影APP用户隐私政策》",
            initialHeaders: {},
            initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
              debuggingEnabled: true,
            )),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
