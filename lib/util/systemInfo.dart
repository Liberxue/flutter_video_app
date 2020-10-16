import 'dart:io';

import 'package:device_info/device_info.dart';

import 'base58.dart';

String getDeviceInfo() {
  String operatingSystem = Platform.operatingSystem;
  // String numberOfProcessors = Platform.numberOfProcessors as String;
  // String operatingSystemVersion = Platform.operatingSystemVersion;
  // String localHostname = Platform.localHostname;
  String version = Platform.version;
  print(version);
  print("decodeBase58 \r\n");
  print(_getId());
  print(decodeBase58(
      "1EnmJWEeiNSDWydzUxPimW6yo2BH7m6sXrveBxrLQBrEtLckrmhThLRydG3DFoFZhVNUvG869f5P6ytpDWQuz4FQQgvVQsvTPY3nWh2SQ3aN3abmAkjSdVw8wV31bMPQtZp4mwNcbNUcwsPHDYeP7iqyeK9T8TJjfMdi1uwiWNAXKaZrygUMgB9AAmJhUAoMiArdPpZt8nWCFx9acuVoGQJE5tA7cYNJfu3gCgehiE18PMZ4KDyMBr2TnzLGHb5BoB4cAmg4bLsQcUEqNyYPfMoxrPYUzbLUSYFb"));
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

//   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
// AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
// print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"

// IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
// print('Running on ${iosInfo.utsname.machine}');
}
