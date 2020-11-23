import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class GetDeviceInfo {
  // String deviceInfo() {
  //   // String operatingSystem = Platform.operatingSystem;
  //   // String numberOfProcessors = Platform.numberOfProcessors as String;
  //   // String operatingSystemVersion = Platform.operatingSystemVersion;
  //   // String localHostname = Platform.localHostname;
  //   String version = Platform.version;
  //   return encodeBase58(version);
  // }

  Future<String> getAllDeviceInfo() async {
    // return json.encode(_deviceInfo);

    return _deviceInfo();
  }

  Future<String> _deviceInfo() async {
    String deviceData;
    var deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceData = androidInfo.version.baseOS;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceData = iosInfo.systemName + iosInfo.systemVersion + iosInfo.model;
      }
    } on PlatformException {
      deviceData = 'Failed to get platform version.';
    }
    return deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Future<bool> isPhysicalDevice() async {
    bool isPhysicalDevice;
    var deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var deviceData = _readAndroidBuildData(await deviceInfo.androidInfo);
        isPhysicalDevice = deviceData['isPhysicalDevice'];
      } else if (Platform.isIOS) {
        var deviceData = _readIosDeviceInfo(await deviceInfo.iosInfo);
        isPhysicalDevice = deviceData['isPhysicalDevice'];
      }
    } on PlatformException {
      isPhysicalDevice = true;
    }
    return isPhysicalDevice;
  }

  Future<String> deviceVersion() async {
    String versionOS;
    var deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var deviceData = _readAndroidBuildData(await deviceInfo.androidInfo);
        versionOS = deviceData['device'];
      } else if (Platform.isIOS) {
        var deviceData = _readIosDeviceInfo(await deviceInfo.iosInfo);
        versionOS = deviceData['systemVersion'];
      }
    } on PlatformException {
      versionOS = "Failed to get platform version";
    }
    return versionOS;
  }

  Future<String> deviceType() async {
    String deviceType;
    var deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var deviceData = _readAndroidBuildData(await deviceInfo.androidInfo);
        deviceType = deviceData['version.baseOS'];
      } else if (Platform.isIOS) {
        var deviceData = _readIosDeviceInfo(await deviceInfo.iosInfo);
        deviceType = deviceData['name'];
      }
    } on PlatformException {
      deviceType = "Failed to get platform version";
    }
    return deviceType;
  }
}
