import 'package:chewie/chewie.dart';
import 'package:ciying/Utils/store.dart';
import 'package:ciying/Widgets/dialog.dart';
import 'package:ciying/Widgets/loading_widget.dart';
import 'package:ciying/api/coin/get_coin.dart';
import 'package:ciying/api/resource/resourceDownload.dart';
import 'package:ciying/api/resource/resourcePreviewRequest.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/accountManager.pb.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/page/Search/search_list.dart';
import 'package:ciying/page/User/Login_out.dart';
import 'package:ciying/page/User/UserCache.dart';
import 'package:ciying/page/Video/my_chewie_custom.dart';
import 'package:fixnum/fixnum.dart';
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
  _VideoPlayerState createState() => _VideoPlayerState();
}

VideoPlayerController _videoPlayerController;
ChewieController _chewieController;
List<ResourceData> resourceDataList;

class _VideoPlayerState extends State<VideoPlayer>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  //
  bool _isDownload = false;
  bool _isLoading = true;
  Int64 _coin = Int64(0);
  bool _isLogin = false;
  UserInfo userInfo;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    _getCoin();
    _resourcePreviewRequest();
    super.initState();
  }

  _getCoin() async {
    GetAccountCoinByAccountIdRequest getAccountCoinByAccountIdRequest =
        new GetAccountCoinByAccountIdRequest();
    var accountId = await Cache.getUserId();
    getAccountCoinByAccountIdRequest.accountId = accountId.toString();
    GetAccountCoinByAccountIdResponse getAccountCoinByAccountIdResponse;
    getAccountCoinByAccountIdResponse =
        await GetAcountCoin.getAccountCoinByAccountIdRequest(
            getAccountCoinByAccountIdRequest);
    if (getAccountCoinByAccountIdResponse != null) {
      if (getAccountCoinByAccountIdResponse.code == ResponseCode.SUCCESSFUL) {
        setState(() {
          _coin = getAccountCoinByAccountIdResponse.coin;
        });
        return;
      }
      setState(() {
        _coin = Int64(0);
      });
      return;
    }
    setState(() {
      _coin = Int64(0);
    });
    return;
  }

  void _resourcePreviewRequest() async {
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

  _getLoginState() async {
    var userInfo = await loadUserCache();
    if (userInfo == null || _isLogin) {
      this._isLogin = false;
      this._isLoading = false;
    } else {
      setState(() {
        this.userInfo = userInfo;
        this._isLogin = true;
        this._isLoading = false;
      });
    }
  }

  void _video() {
    // _downloadFile();
    //  _videoPlayerController = VideoPlayerController.file(file)
    // print("video url ${resourceDataList[0].resourceAddress}");
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
    _getLoginState();
  }

  Stream<FileResponse> fileStream;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<bool> _saveNetworkVideo() async {
    String albumName = CommonConfig.ConfAppName;
    ResourceDownloadRequest resourceDownloadRequest =
        new ResourceDownloadRequest();
    var accountId = await Cache.getUserId();
    resourceDownloadRequest.resourceId = widget._resourceSection.resourceID;
    resourceDownloadRequest.accountId = accountId.toString();
    ResourceDownload.resourceresourceDownloadAPIRequest(
        resourceDownloadRequest);
    return GallerySaver.saveVideo(resourceDataList[0].resourceAddress,
        albumName: albumName);
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) -
        50;
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          title: Container(
            color: Colors.white10,
            child: Text(
              widget._resourceSection.transcript,
              style: TextStyle(
                color: Color(0xFF17262A),
                fontSize: 18,
              ),
            ),
          ),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Color(0xFF17262A),
              ),
              onPressed: () {
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
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: this._isLoading
                      ? loadingWidget(context, false)
                      : Chewie(
                          controller: _chewieController,
                        ),
                ),
              ],
            ),
            Positioned(
              // top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  // borderRadius: const BorderRadius.only(
                  //     topLeft: Radius.circular(32.0),
                  //     topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight: tempHeight > infoHeight
                              ? tempHeight
                              : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, left: 18, right: 16),
                            child: Text(
                              "台词：${widget._resourceSection.transcript}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: Color(0xFF17262A),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "当前积分:" + _coin.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Color(0xFF4A6572),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "时长：${widget._resourceSection.duration} 秒",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 18,
                                          letterSpacing: 0.27,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.lock_clock,
                                      //   color: Colors.blue,
                                      //   size: 24,
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity1,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  // getTimeBoxUI('24', 'Classe'),
                                  // getTimeBoxUI('2hours', 'Time'),
                                  // getTimeBoxUI('24', 'Seat'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Text(
                                  "来源：${widget._resourceSection.source}",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // Container(
                                  //   width: 48,
                                  //   height: 48,
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       color: DesignCourseAppTheme.nearlyWhite,
                                  //       borderRadius: const BorderRadius.all(
                                  //         Radius.circular(16.0),
                                  //       ),
                                  //       border: Border.all(
                                  //           color: DesignCourseAppTheme.grey
                                  //               .withOpacity(0.2)),
                                  //     ),
                                  //     child: Icon(
                                  //       Icons.add,
                                  //       color: Colors.white,
                                  //       size: 28,
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   width: 16,
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      // islogin
                                      if (!this._isLogin) {
                                        dialogShow("请先登陆 下载");
                                        return loginOut(context);
                                      } else if (_coin <
                                          Int64(CommonConfig.DefaultCoin)) {
                                        return dialogShow("无法下载 积分不足");
                                      }
                                      var yyDialog = progressDialogBody();
                                      yyDialog.show();
                                      var result = _saveNetworkVideo();
                                      result.then((value) {
                                        yyDialog?.dismiss();
                                        dialogShow("下载完成");
                                        _getCoin();
                                        setState(() {
                                          _isDownload = true;
                                        });
                                      });
                                    },
                                    child: Container(
                                      height: 48,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF00B6F0),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Color(0xFF00B6F0)
                                                  .withOpacity(0.5),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 10.0),
                                        ],
                                      ),
                                      child: Center(
                                        child: !_isDownload
                                            ? Text(
                                                "无水印下载  消耗" +
                                                    CommonConfig.DefaultCoin
                                                        .toString() +
                                                    "积分",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                ))
                                            : Text("已下载,请在相册查看",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.0,
                                                  color: Colors.red[200],
                                                  fontSize: 18,
                                                )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: Colors.white,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
