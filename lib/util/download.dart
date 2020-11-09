import 'package:flutter_downloader/flutter_downloader.dart';

downloadFile(List<String> downloadUrlList, savePath) async {
  for(var downloadUrl in downloadUrlList) {
  await FlutterDownloader.enqueue(
    url: downloadUrl,
    savedDir: savePath,
    showNotification: true,
    // show download progress in status bar (for Android)
    openFileFromNotification:
        true, // click on notification to open downloaded file (for Android)
  );
  }
}