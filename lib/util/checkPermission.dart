import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// checkPermission
Future<bool> checkPermission(BuildContext context) async {
  // 先对所在平台进行判断
  if (Theme.of(context).platform == TargetPlatform.android) {
   final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }


// 获取存储路径
Future<String> findLocalPath(BuildContext context) async {
  // 如果是android，使用getExternalStorageDirectory
  // 如果是iOS，使用getApplicationSupportDirectory
  final directory = Theme.of(context).platform == TargetPlatform.android
      ? await getExternalStorageDirectory()
      : await getApplicationSupportDirectory();
  return directory.path;
}