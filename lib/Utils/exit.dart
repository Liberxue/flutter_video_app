import 'package:flutter/services.dart';

Future<void> exitApp() async {
  SystemNavigator.pop();
  await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}
