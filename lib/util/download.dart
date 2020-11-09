// 根据 downloadUrl 和 savePath 下载文件
import 'package:flutter_downloader/flutter_downloader.dart';

DdownloadFile(downloadUrl, savePath) async {
  await FlutterDownloader.enqueue(
    url: downloadUrl,
    savedDir: savePath,
    showNotification: true,
    // show download progress in status bar (for Android)
    openFileFromNotification:
        true, // click on notification to open downloaded file (for Android)
  );
}