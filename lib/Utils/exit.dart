 import 'package:flutter/services.dart';

Future<void> ExitApp() async {
    SystemNavigator.pop();
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}