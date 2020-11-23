import 'package:ciying/common/AppConfig.dart';
import 'package:ciying/common/constants.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/models/signIn/signIn.dart';
import 'package:ciying/page/User/Register.dart';
import 'package:ciying/page/Search/search.dart';
import 'package:ciying/util/exit.dart';
import 'package:ciying/util/hexColor.dart';
import 'package:ciying/util/response_code_enum.dart';
import 'package:ciying/util/store.dart';
import 'package:ciying/util/validation.dart';
import 'package:ciying/widgets/CustomDialog.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  ///正在输入TextField的边框颜色
  Color selectColor = HexColor("#252C4E");

  ///未在输入TextField的边框颜色
  Color normalColor = Color.fromARGB(
    100,
    100,
    100,
    100,
  );

  ///手机号焦点控制
  FocusNode userPhoneFieldNode = new FocusNode();

  ///用户密码焦点控制
  FocusNode userPasswordFieldNode = new FocusNode();

  ///用户确认输入密码焦点控制
  FocusNode userRepeatPasswordFieldNode = new FocusNode();

  ///用户手机号输入框TextField的控制器
  TextEditingController _userPhoneTextController;

  ///用户密码输入框TextField的控制器
  TextEditingController _userPasswrodtController;
  //登陆动画控制器
  AnimationController registerAnimatController;

  //Logo动画控制器
  AnimationController logoAnimatController;
  Animation logoAnimation;

  //输入框动画控制器
  //当输入的手机号不合格或者是密码不合格时
  //通过此动画实现抖动效果
  AnimationController inputAnimatController;
  Animation inputAnimaton;

  ///抖动动画执行次数
  int inputAnimationNumber = 3;

  ///输入手机号码合格标识
  /// 11位为合格，此值为false 否则为为true不合格
  bool isPhoneError = false;

  ///输入密码合格标识
  /// 6-12位为合格，此值为false 否则为true不合格
  bool isPasswordError = false;

  ///生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();

    //输入手机号TextField控制器
    _userPhoneTextController = TextEditingController();
    //输入密码TextField控制器
    _userPasswrodtController = TextEditingController();

    userPhoneFieldNode.addListener(() {
      if (this
          .mounted) //fix lifecycle state: defunct, not mounted, tickers: tracking 3 tickers
        setState(() {});
    });
    registerAnimatController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    registerAnimatController.addListener(() {
      // double value = registerAnimatController.value;
      // print("登陆变化比率 $value");
      if (this
          .mounted) //fix lifecycle state: defunct, not mounted, tickers: tracking 3 tickers
        setState(() {});
    });

    logoAnimatController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    logoAnimatController.addListener(() {
      if (this
          .mounted) //fix lifecycle state: defunct, not mounted, tickers: tracking 3 tickers
        setState(() {});
    });
    logoAnimation = Tween(begin: 1.0, end: 0.0).animate(logoAnimatController);

    //添加监听
    WidgetsBinding.instance.addObserver(this);

    ///这里是通过左右摆动两次来实现的抖动动画
    inputAnimatController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);

    ///构建线性动画，从0-10的匀速
    inputAnimaton =
        new Tween(begin: 0.0, end: 10.0).animate(inputAnimatController);

    ///添加监听，动画执行的每一帧都会回调这里
    inputAnimatController.addListener(() {
      // double value = inputAnimatController.value;
      // print("变化比率 $value");
      if (this
          .mounted) //fix lifecycle state: defunct, not mounted, tickers: tracking 3 tickers
        setState(() {});
    });

    ///添加动画执行状态监听
    inputAnimatController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // print("正向执行完毕 调用 forward方法动画执行完毕的回调");
        inputAnimationNumber++;

        ///反向执行动画
        inputAnimatController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // print("反向执行完毕 调用reverse方法动画执行完毕的回调");

        ///重置动画
        inputAnimatController.reset();

        ///记录动画的执行次数
        ///执行2次便达到了左右抖动的视觉效果
        if (inputAnimationNumber < 2) {
          //正向执行动画
          inputAnimatController.forward();
        } else {
          inputAnimationNumber = 0;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    //解绑
    logoAnimatController.stop();
    registerAnimatController.stop();
    inputAnimaton.removeStatusListener((status) {
      Stopwatch();
    });
    inputAnimatController.stop();
    WidgetsBinding.instance.removeObserver(this);
  }

  //应用尺寸改变时回调
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    /*
     *Frame是一次绘制过程，称其为一帧，Flutter engine受显示器垂直同步信号"VSync"的驱使不断的触发绘制，
     *Flutter可以实现60fps（Frame Per-Second），就是指一秒钟可以触发60次重绘，FPS值越大，界面就越流畅。
     */
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //注意，不要在此类回调中再触发新的Frame，这可以会导致循环刷新。
      if (this
          .mounted) //fix lifecycle state: defunct, not mounted, tickers: tracking 3 tickers
        setState(() {
          ///获取底部遮挡区域的高度
          // double keyboderFlexHeight = MediaQuery.of(context).viewInsets.bottom;
          // print("键盘的高度 keyboderFlexHeight $keyboderFlexHeight");
          if (MediaQuery.of(context).viewInsets.bottom == 0) {
            //关闭键盘 启动logo动画反向执行 0.0 -1.0
            // logo 布局区域显示出来
            logoAnimatController.reverse();
          } else {
            //显示键盘 启动logo动画正向执行 1.0-0.0
            // logo布局区域缩放隐藏
            logoAnimatController.forward();
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('你确定要退出吗？'),
                actions: <Widget>[
                  RaisedButton(
                      child: Text('退出'),
                      //onPressed: () => Navigator.of(context).pop(true)),
                      onPressed: () async {
                        await ExitApp();
                      }),
                  RaisedButton(
                      child: Text('取消'),
                      onPressed: () => Navigator.of(context).pop(false)),
                ],
              )),
      child: Scaffold(
        //阻止界面resize
        resizeToAvoidBottomInset: false,

        ///层叠布局
        ///全局的手势
        body: GestureDetector(
          onTap: () {
            //隐藏键盘
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            //输入框失去焦点
            userPhoneFieldNode.unfocus();
            userPasswordFieldNode.unfocus();
          },
          child: Stack(
            children: [
              ///构建背景
              buildBgWidget(),

              ///构建阴影层
              // buildBlurBg(),

              ///构建用户信息输入框
              buildLoginInputWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  ///构建背景
  buildBgWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      // child: Image.asset(
      //   "assets/images/bg_kyzg_login.png",
      //   fit: BoxFit.fill,
      // ),
      child: Container(color: AppDesignCourseAppTheme.BackgroundColor),
    );
  }

  ///构建阴影层
  buildBlurBg() {
    return Container(
      color: Color.fromARGB(
        155,
        100,
        100,
        100,
      ),
    );
  }

  ///构建用户信息输入框
  buildLoginInputWidget(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    ///填充
    return Positioned(
      left: 0,
      right: 0,
      top: height / 7,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),

        ///竖直方向的线性布局
        child: Column(
          children: [
            ///顶部距离
            Container(
              margin: EdgeInsets.only(
                  left: 22, right: 22, top: 100.0 * logoAnimation.value),
            ),

            ///logo
            buildLogoWidget(),
            //间隔
            SizedBox(
              height: 80,
            ),

            ///构建用户输入手机号UI
            buildUserRowWidgets(Icons.phone_android, "请输入11位手机号", false,
                userPhoneFieldNode, _userPhoneTextController, isPhoneError),
            //间隔
            SizedBox(
              height: 12,
            ),

            ///构建启用输入密码UI
            buildUserRowWidgets(
                Icons.lock_open,
                "请输入6-12密码",
                true,
                userPasswordFieldNode,
                _userPasswrodtController,
                isPasswordError),
            // buildAgreementWidget(),

            ///间隔
            Container(
              margin: EdgeInsets.only(top: 40),
            ),

            ///构建登陆按钮
            buildLoginButton(context),

            Container(
              margin: EdgeInsets.only(top: 30),
            ),
            Container(
                // alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.5,
                // height: 48,
                child: new RaisedButton(
                    color: Colors.grey[80],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    padding: EdgeInsets.all(10),
                    onPressed: () async {
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) => Register()));
                      Navigator.of(context).pushAndRemoveUntil(
                          new MaterialPageRoute(
                              builder: (context) => new Register()),
                          (route) => route == null);
                    },
                    child: new Text("没有账号？注册",
                        style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black45)))),
          ],
        ),
      ),
    );
  }

  ///构建顶部logo
  buildLogoWidget() {
    ///缩放布局
    return ScaleTransition(
      //设置动画的缩放中心
      alignment: Alignment.center,
      //动画控制器
      scale: logoAnimation,
      //将要执行动画的子view
      child: Row(
        ///主方向子View居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            ///圆角矩形
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                "assets/images/logo.png",
                height: 50,
                width: 50,
              ),
            ),
            padding: EdgeInsets.only(right: 14),
          ),
          Text(
            CommonConfig.ConfAppName,
            style: TextStyle(

                ///文字的大小
                fontSize: 40,
                color: Colors.blueGrey,

                ///引用圆滑的自定义字体
                fontFamily: "UniTortred"),
          )
        ],
      ),
    );
  }

  ///构建用户输入手机号、密码通用 UI
  buildUserRowWidgets(
      IconData preIconData,
      String hintText,
      bool isPasswordInput,
      FocusNode focusNode,
      TextEditingController controller,
      bool isError) {
    return Transform.translate(
        //只有为输入校验错误里才启用左右平移实现抖动提示效果
        offset: Offset(isError ? inputAnimaton.value : 0, 0),
        child: Container(
          margin: EdgeInsets.only(
            left: 22,
            right: 22,
          ),
          decoration: BoxDecoration(
            color:
                focusNode.hasFocus ? HexColor('#AFB0BC') : HexColor('#E5E6EA'),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: focusNode.hasFocus
                      ? HexColor('#AFB0BC')
                      : HexColor('#E5E6EA'),
                  offset: const Offset(0, 2),
                  blurRadius: 30.0),
            ],
          ),
          // decoration: BoxDecoration(
          //   color: HexColor('#F4F5F7'),
          //   borderRadius: BorderRadius.all(Radius.circular(30)),
          //   border: Border.all(
          //       color: focusNode.hasFocus ? selectColor : HexColor('#F4F5F7')),
          // ),
          child: buildInputItemRow(
              preIconData, hintText, isPasswordInput, focusNode, controller),
        ));
  }

  ///[preIconDate] 输入框前的小图标
  ///[hintText] 提示文字
  ///[focusNode] 焦点控制
  ///[controller]输入框控制器
  buildInputItemRow(IconData preIconDate, String hintText, bool isPasswordInput,
      FocusNode focusNode, TextEditingController controller) {
    var textField = TextField(
      controller: controller,
      focusNode: focusNode,

      ///点击键盘上的回车按钮回调事件函数
      ///参数[value]获取的是当前TextField中输入的内容
      onSubmitted: (value) {
        // 电话输入失去焦点
        userPhoneFieldNode.unfocus();
        //密码输入  获取焦点
        FocusScope.of(context).requestFocus(userPasswordFieldNode);
      },

      ///键盘回车键的样式
      textInputAction: TextInputAction.done,

      ///输入文本格式过滤
      inputFormatters: [
        ///输入的内容长度为 11 位
        LengthLimitingTextInputFormatter(11),
      ],

      ///设置键盘的类型
      keyboardType: isPasswordInput ? TextInputType.text : TextInputType.number,

      obscureText: isPasswordInput ? true : false,

      ///输入文本的样式
      style: TextStyle(
        fontSize: 16.0,
        color: HexColor("#1C284E"),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: normalColor,
        ),
        border: InputBorder.none,
        // suffixIcon: Icon(
        //   Icons.remove_red_eye,
        // ),
        // suffixText: "suffixText",
      ),
    );
    return Row(
      children: [
        ///左侧小图标
        Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: Icon(
            preIconDate,
            color: Colors.grey,
            size: 26,
          ),
        ),

        ///竖线
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 1,
            height: 26,
            color: normalColor,
          ),
        ),

        ///输入框
        Expanded(
          child: textField,
        ),

        ///清除选项
        focusNode.hasFocus
            ? InkWell(
                onTap: () {
                  ///清除输入框内容
                  controller.text = "";
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 12),
                  child: Icon(
                    Icons.cancel,
                    size: 22,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  ///登陆按钮
  buildLoginButton(BuildContext context) {
    ///点击事件
    return InkWell(
      onTap: () {
        ///隐藏输入框焦点
        userPasswordFieldNode.unfocus();
        userPhoneFieldNode.unfocus();

        ///获取输入的电话号码
        String inputPhone = _userPhoneTextController.text;
        if (inputPhone.length < 11) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDialog(
                  // title: '数据不合法',
                  content: '手机号码格式不正确',
                  isCancel: false,
                  outsideDismiss: true,
                  confirmCallback: () {
                    registerAnimatController.reverse();
                    isPhoneError = true;
                    inputAnimatController.forward();
                  },
                );
              });
          return;
        } else if (!isChinaPhoneLegal(inputPhone)) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDialog(
                  content: '手机号码格式不正确',
                  isCancel: false,
                  outsideDismiss: true,
                  confirmCallback: () {
                    registerAnimatController.reverse();
                    isPhoneError = true;
                    inputAnimatController.forward();
                  },
                );
              });
          return;
        } else {
          isPhoneError = false;
        }

        ///获取输入的密码
        String inputPassword = _userPasswrodtController.text;
        if (inputPassword.length < 6) {
          ///更新标识 触发抖动动画
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDialog(
                  content: '密码长度需在6-12位',
                  isCancel: false,
                  outsideDismiss: true,
                  confirmCallback: () {
                    registerAnimatController.reverse();
                    isPasswordError = true;
                    inputAnimatController.forward();
                  },
                );
              });
          return;
        } else {
          isPasswordError = false;
        }

        ///提交数据
        registerAnimatController.forward();

        Future.delayed(Duration(milliseconds: 10), () async {
          SignInResponse _signInResponse;
          SignInRequest signInRequest = SignInRequest();
          signInRequest.loginType = LoginType.PHONEMESSAGEAUTHCODE;
          signInRequest.passWord = inputPassword;
          signInRequest.phoneNumber = Int64(int.parse(inputPhone));

          _signInResponse = await signIn(signInRequest);
          if (_signInResponse == null) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDialog(
                    title: '登录异常',
                    content: '登录异常,请稍后重试',
                    isCancel: false,
                    outsideDismiss: true,
                    confirmCallback: () {
                      Future.delayed(Duration(milliseconds: 2000), () {
                        registerAnimatController.reverse();
                      });
                      currentRestureStatus = RestureStatus.error;
                      if (this
                          .mounted) //fix lifecycle state: defunct, not mounted, tickers: tracking 3 tickers
                        setState(() {
                          MediaQuery.of(context).viewInsets.bottom == 0;
                        });
                    },
                  );
                });
            return;
            // 多语言支持？#issue https://github.com/PomCloud/ciying/issues/3
          } else if (_signInResponse.code != ResponseCode.SUCCESSFUL) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return CustomDialog(
                    title: '登录提示',
                    content: responseCodeEnum(_signInResponse.code),
                    isCancel: false,
                    outsideDismiss: true,
                    confirmCallback: () {
                      Future.delayed(Duration(milliseconds: 2000), () {
                        registerAnimatController.reverse();
                      });
                      currentRestureStatus = RestureStatus.error;
                      if (this
                          .mounted) //fix lifecycle state: defunct, not mounted, tickers: tracking 3 tickers
                        setState(() {
                          MediaQuery.of(context).viewInsets.bottom == 0;
                        });
                    },
                  );
                });
            return;
          } else {
            currentRestureStatus = RestureStatus.success;
            if (this
                .mounted) //fix lifecycle state: defunct, not mounted, tickers: tracking 3 tickers
              setState(() {});
            Future.delayed(Duration(milliseconds: 1), () async {
              await Cache.setCache("Token", _signInResponse.token);
              await Cache.setCache("User", _signInResponse.data.name);
              await Cache.setCache(
                  "AvatarImage", _signInResponse.data.avatarImage);
              await Cache.setCache(
                  "PhoneNumber", _signInResponse.data.phoneNumber.toString());
              await Cache.setCache(
                  "Coin", _signInResponse.data.coin.toString());
              await Cache.setCache(
                  "AccountLevelName", _signInResponse.data.accountLevelName);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SearchPage(),
              ));
            });
          }
        });
      },

      ///加载进度圆圈与底层显示
      child: Stack(
        children: [
          ///缩放变换
          Transform(
              alignment: Alignment.center,
              transform: Matrix4.diagonal3Values(
                  1.0 - registerAnimatController.value, 1.0, 1.0),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 48,
                margin: EdgeInsets.only(
                  left: 22,
                  right: 22,
                ),

                ///圆角矩形背景
                // decoration: BoxDecoration(
                //     color: HexColor("#252C4E"),
                //     borderRadius: BorderRadius.all(Radius.circular(30)),
                //     border: Border.all(color: normalColor)),
                decoration: BoxDecoration(
                  color: HexColor("#252C4E"),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor("#252C4E"),
                        offset: const Offset(0, 2),
                        blurRadius: 12.0),
                  ],
                ),

                ///透明度
                child: Text(
                  "登陆",
                  style: TextStyle(
                      fontSize: 18,
                      color: HexColor("#E5E6EA"),
                      fontWeight: FontWeight.w500),
                ),
              )),

          ///进度圆圈
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///透明度
              Opacity(
                ///中间显示的Widget透明度
                opacity: registerAnimatController.value,
                child: Container(
                    height: 48.0,
                    width: 48.0,
                    padding: EdgeInsets.all(10),

                    ///根据不同状态来修改不同的登陆中间的显示Widget
                    child: buildLoadingWidget(),
                    decoration: BoxDecoration(
                      color: Color(0x50fafafa),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  RestureStatus currentRestureStatus = RestureStatus.none;

  ///动态构建不同的显示进度圆圈
  /// 加载中、加载错误、加载成功
  Widget buildLoadingWidget() {
    ///默认使用加载中
    Widget loadingWidget = CircularProgressIndicator();
    if (currentRestureStatus == RestureStatus.success) {
      ///加载成功显示小对钩
      loadingWidget = Icon(
        Icons.check,
        color: Colors.deepOrangeAccent,
      );
    } else if (currentRestureStatus == RestureStatus.error) {
      ///加载失败状态显示 小X
      loadingWidget = Icon(
        Icons.close,
        color: Colors.red,
      );
    }
    return loadingWidget;
  }
}

enum RestureStatus {
  none, //无状态
  loading, //加载中
  success, //加载成功
  error, //加载失败
  rever, //重试
}
