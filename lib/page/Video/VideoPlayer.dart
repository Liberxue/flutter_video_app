import 'package:ciying/Widgets/dialog.dart';
import 'package:ciying/api/resource/resourcePreviewRequest.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:chewie/chewie.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Search/search_list.dart';
import 'package:ciying/page/Video/my_chewie_custom.dart';
import 'package:ciying/Utils/hexColor.dart';
import 'package:ciying/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final String searchText;
  final ResourceSection _resourceSection;
  VideoPlayer(this.searchText, this._resourceSection);
  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerState();
  }
}

VideoPlayerController _videoPlayerController;
ChewieController _chewieController;
List<ResourceData> resourceDataList;

class _VideoPlayerState extends State<VideoPlayer> with WidgetsBindingObserver {
  bool _isDownload = false;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _resourcePreviewRequest();
  }

  void _resourcePreviewRequest() async {
    // print("资源ID ");
    // print(widget._resourceSection.resourceID);
    // // List<String> resourceIdList = List<String>(0);
    // // resourceIdList.add(widget._resourceSection.resourceID);

    ResourcePreviewRequest resourcePreviewRequest = ResourcePreviewRequest();
    resourcePreviewRequest.resourceId = widget._resourceSection.resourceID;
    ResourcePreviewResponse resourcePreviewResponse =
        await Resource.resourcePreviewAPIRequest(resourcePreviewRequest);
    if (resourcePreviewResponse.code != ResponseCode.SUCCESSFUL) {
      // print("resourcePreviewResponse.code !=0");
      // EasyLoading.showSuccess('Use in initState');
      dialogShow("资源不存在，或者丢失");
      setState(() {
        _isLoading = false;
      });
    }
    setState(() {
      resourceDataList = resourcePreviewResponse.data;
      if (resourceDataList != null) {
        _video();
        _isLoading = false;
      }
      // EasyLoading.showSuccess('Use in initState');
      // _isLoading = false;
    });
  }

  void _video() {
    // _downloadFile();
    //  _videoPlayerController = VideoPlayerController.file(file)
    _videoPlayerController =
        VideoPlayerController.network(resourceDataList[0].resourceAddress);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      placeholder: Center(
        child: Text(
          "正在缓冲",
          style: TextStyle(color: Colors.white),
        ),
      ),
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      showControls: true,
      autoInitialize: true,
      customControls: MyChewieMaterialControls(),
    );
  }

  Stream<FileResponse> fileStream;

  // void _downloadFile() {
  //   setState(() {
  //     fileStream = DefaultCacheManager().getFileStream(
  //         resourceDataList[0].resourceAddress,
  //         withProgress: true);
  //   });
  //   // print(fileStream);
  //   // print("cache end");
  // }

  // void _clearCache() {
  //   DefaultCacheManager().emptyCache();
  //   setState(() {
  //     fileStream = null;
  //   });
  // }

  Future<bool> _saveNetworkVideo() async {
    String albumName = CommonConfig.ConfAppName;
    // getFileStream(url)
    return GallerySaver.saveVideo(resourceDataList[0].resourceAddress,
        albumName: albumName);
    //   .then((bool success) {
    // YYProgressDialogBody().dismiss();
    // });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final platform = Theme.of(context).platform;
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          title: Container(
            color: Colors.white10,
            child: Text(
              widget._resourceSection.transcript,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: HexColor("#252C4E"),
              ),
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SearchList(widget.searchText),
                ));
                Navigator.pop(context);
              },
            );
          }),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
      ),
      body: this._isLoading
          ? loadingWidget(context, false)
          : SizedBox(
              child: new Card(
                  // elevation: 1.0, //设置阴影
                  // shape: const RoundedRectangleBorder(
                  //     borderRadius:
                  //         BorderRadius.all(Radius.circular(24.0))), //设置圆角
                  child: new Column(children: <Widget>[
              new Container(
                child: new Column(
                  children: <Widget>[
                    videoPlay(context),
                    new Container(
                      margin: EdgeInsets.only(top: 10),
                      child: new Text(
                          "台词：${widget._resourceSection.transcript}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey)),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 2),
                      child: new Text("来源：${widget._resourceSection.source}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey)),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 2, bottom: 40),
                      child: new Text(
                          "时长：${widget._resourceSection.duration} 秒",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey)),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 2.0),
                      child: new Text(widget._resourceSection.sourceName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 5.0),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius:
                              30.0, // has the effect of softening the shadow
                          spreadRadius:
                              5.0, // has the effect of extending the shadow
                          offset: Offset(
                            0.0, // horizontal, move right 10
                            -20.0, // vertical, move down 10
                          ),
                        )
                      ]),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: MediaQuery.of(context).size.height / 10,
                      child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new FlatButton.icon(
                                onPressed: () {},
                                icon: new Icon(Icons.favorite_border),
                                label: new Text("收藏")),
                            new FlatButton.icon(
                                onPressed: () {
                                  // check 积分。。。。
                                  var yyDialog = progressDialogBody();
                                  yyDialog.show();
                                  var result = _saveNetworkVideo();
                                  result.then((value) {
                                    yyDialog?.dismiss();
                                    setState(() {
                                      _isDownload = true;
                                    });
                                  });
                                },
                                icon: !_isDownload
                                    ? Icon(
                                        Icons.download_outlined,
                                      )
                                    : Icon(
                                        Icons.download_done_rounded,
                                        color: Colors.red,
                                      ),
                                label: !_isDownload
                                    ? Text("无水印下载",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ))
                                    : Text("已下载,请在相册查看",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                        ))),
                          ]),
                    )
                  ],
                ),
              ),
            ]))),
    );
  }

  Widget videoPlay(BuildContext context) {
    return Container(
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}

YYDialog progressDialogBody() {
  return YYDialog().build()
    ..width = 200
    ..borderRadius = 4.0
    ..barrierDismissible = false // 是否点击弹出外部消失
    ..circularProgress(
      padding: EdgeInsets.all(24.0),
      valueColor: Colors.orange[500],
    )
    ..text(
      padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 12.0),
      text: "正在下载,请稍后...",
      alignment: Alignment.center,
      color: Colors.orange[500],
      fontSize: 18.0,
    );
  // ..show();
}
