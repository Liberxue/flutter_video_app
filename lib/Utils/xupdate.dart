import 'package:ciying/Utils/systemInfo.dart';
import 'package:ciying/Utils/toast.dart';
import 'package:flutter_xupdate/flutter_xupdate.dart';

class XUpdate {
  XUpdate._internal();

  static const String UPDATE_URL =
      "https://www.ciyingai.com/api/update/updateVersion";

  static void initAndCheck() {
    if (GetDeviceInfo.isAndroid()) {
      init(url: UPDATE_URL);
    }
  }

  ///初始化XUpdate
  static void init({String url = ""}) {
    FlutterXUpdate.init(

            ///是否输出日志
            debug: true,

            ///是否使用post请求
            isPost: false,

            ///post请求是否是上传json
            isPostJson: false,

            ///是否开启自动模式
            isWifiOnly: false,

            ///是否开启自动模式
            isAutoMode: false,

            ///需要设置的公共参数
            supportSilentInstall: false,
            retryContent: "Github下载速度太慢了，是否考虑切换蒲公英下载？",
            retryUrl: "https://www.pgyer.com/flutter_learn")
        .then((_result) {
      print("XUpdate初始化结果: $_result");
      if (url.isNotEmpty) {
        checkUpdate(url);
      }
    });
    FlutterXUpdate.setErrorHandler(
        onUpdateError: (Map<String, dynamic> message) async {
      ///2004是无最新版本
      if (message['code'] != 2004) {
        ///4000是下载失败
        if (message['code'] == 4000) {
          FlutterXUpdate.showRetryUpdateTipDialog(
              retryContent: "Github被墙无法继续下载，是否考虑切换蒲公英下载？",
              retryUrl: "https://www.pgyer.com/flutter_learn");
        } else {
          ToastUtils.error(message['detailMsg']);
        }
      }
    });
  }

  ///初始化XUpdate
  static void checkUpdate(String url) {
    FlutterXUpdate.checkUpdate(url: url, widthRatio: 0.7);
  }

  ///初始化XUpdate
  static void checkUpdateWithErrorTip({String url = UPDATE_URL}) {
    FlutterXUpdate.setErrorHandler(
        onUpdateError: (Map<String, dynamic> message) async {
      ///4000是下载失败
      if (message['code'] == 4000) {
        FlutterXUpdate.showRetryUpdateTipDialog(
            retryContent: "Github被墙无法继续下载，是否考虑切换蒲公英下载？",
            retryUrl: "https://www.pgyer.com/flutter_learn");
      } else {
        ToastUtils.error(message['message']);
      }
    });
    FlutterXUpdate.checkUpdate(
      url: url,
      widthRatio: 0.7,
      themeColor: '#FFFFAC5D',
      topImageRes: 'bg_update_top',
    );
  }
}
