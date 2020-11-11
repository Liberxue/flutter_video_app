import 'package:flutter_downloader/flutter_downloader.dart';

class TaskInfo {
  final String name;
  final String link;

  String taskId;
  int progress = 0;
  DownloadTaskStatus status = DownloadTaskStatus.undefined;

  TaskInfo({this.name, this.link});
}

class ItemHolder {
  final String name;
  final TaskInfo task;

  ItemHolder({this.name, this.task});
}

downloadFile(List<String> downloadUrlList, savePath) async {
  for(var downloadUrl in downloadUrlList) {
  await FlutterDownloader.enqueue(
    url: downloadUrl,
    fileName: "liber.jpg",
    savedDir: savePath,
    showNotification: true,
    // show download progress in status bar (for Android)
    openFileFromNotification:
        true, // click on notification to open downloaded file (for Android)
  );
  }
}