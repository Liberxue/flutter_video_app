import 'dart:io';

import 'package:device_info/device_info.dart';

import 'base58.dart';

String getDeviceInfo() {
  // String operatingSystem = Platform.operatingSystem;
  // String numberOfProcessors = Platform.numberOfProcessors as String;
  // String operatingSystemVersion = Platform.operatingSystemVersion;
  // String localHostname = Platform.localHostname;
  String version = Platform.version;
  return encodeBase58(version);
}

Future<String> _getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
}
