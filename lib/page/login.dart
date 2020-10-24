import 'dart:io';

import 'package:CiYing/common/constants.dart';
import 'package:CiYing/grpc/proto/common.pbenum.dart';
import 'package:CiYing/grpc/proto/gateWay.pbgrpc.dart';
import 'package:CiYing/models/signIn/signIn.dart';
import 'package:CiYing/page/search_list.dart';
import 'package:CiYing/page/userPrivacyAgreement.dart';
import 'package:CiYing/page/userRegistrationAgreement.dart';
import 'package:CiYing/util/exit.dart';
import 'package:CiYing/util/store.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
class Login extends StatefulWidget {
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> with WidgetsBindingObserver {

  // 输入框的焦点实例
  FocusNode _focusNode;
  // 当前键盘是否是激活状态
  bool isKeyboardActived = false;

  ///RichText中隐私协议的手势
  TapGestureRecognizer _privacyProtocolRecognizer;
  ///RichText中注册协议的手势
  TapGestureRecognizer _registProtocolRecognizer;

  @override
  void initState() {
    super.initState();
    //注册协议的手势
    _registProtocolRecognizer = TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer = TapGestureRecognizer();
     _focusNode = FocusNode();
    // 监听输入框焦点变化
    _focusNode.addListener(_onFocus);
    // 创建一个界面变化的观察者
    WidgetsBinding.instance.addObserver(this);
  }

// 焦点变化时触发的函数
_onFocus() {
    if (_focusNode.hasFocus) {
    // 聚焦时候的操作
    return;
    }
}
 
@override
void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        // 当前是安卓系统并且在焦点聚焦的情况下
        if (Platform.isAndroid && _focusNode.hasFocus) {
            if (isKeyboardActived) {
                isKeyboardActived = false;
                // 使输入框失去焦点
                _focusNode.unfocus();
                return;
            }
            isKeyboardActived = true;
        }
    });
}
 
// 卸载，防止内存泄漏
@override
void dispose() {
    super.dispose();
    _focusNode.dispose();
    WidgetsBinding.instance.removeObserver(this);
}

  
  ///复选框的选中标识
  bool checkIsSelect = false;

  ///使用图片素材自定义圆形自选框
  buildCircleCheckBox() {
    return Container(
      // padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          setState(() {
            checkIsSelect = !checkIsSelect;
          });
        },
        child: Image.asset(
          checkIsSelect
              ? "images/no_select_icon.png"
              : "images/select_icon.png",
          width: 18,
          height: 18,
        ),
      ),
    );
  }

  Duration get loginTime => Duration(milliseconds: 10);
  Future<String> _authUser(LoginData data) async {
    SignInRequest signInRequest =SignInRequest();
    signInRequest.loginType=LoginType.PHONEMESSAGEAUTHCODE;
    signInRequest.passWord=data.password;
    signInRequest.phoneNumber=Int64(int.parse(data.name));
    SignInResponse signInResponse = await signIn(signInRequest);
    return Future.delayed(loginTime).then((_) async {
      if(signInResponse.code!=ResponseCode.SUCCESSFUL){
          return "登录失败，请检查账号密码"; // 多语言支持？#issue https://github.com/PomCloud/CiYing/issues/3
      }
      if (signInResponse.token.length<1){ //mark check token
        return  "登录异常";
      }
      await Cache.setCache("token",signInResponse.token);
      await Cache.setCache("avatarImage", signInResponse.data.avatarImage);
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    // return Future.delayed(loginTime).then((_) {
    //   if (!users.containsKey(name)) {
    //     return '手机号码不存在!';
    //   }
    //   return null;
    // });
  }

  @override
  Widget build(BuildContext context) {
  // getMethod("token").then((token)=> {
  //  if(token.length>0){
  //   Navigator.push(
  //     context, MaterialPageRoute(builder: (context) => SearchList(),maintainState: false))
  // }
    return WillPopScope(
      onWillPop: () async => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('你确定要退出吗？'),
                actions: <Widget>[
                  RaisedButton(
                      child: Text('退出'),
                      //onPressed: () => Navigator.of(context).pop(true)),
                    onPressed:() async {
                       await ExitApp();
                      }),                      
                  RaisedButton(
                      child: Text('取消'),
                      onPressed: () => Navigator.of(context).pop(false)),
                      
                ],
              )),
      child: Stack(
    children: <Widget>[
      FlutterLogin(
      title: APPNAME,
      // logo: 'assets/images/logo.png',
      messages: LoginMessages(
        usernameHint: '请输入11位手机号',
        passwordHint: '请输入6-12密码',
        confirmPasswordHint: '密码确认',
        loginButton: '登入',
        signupButton: '注册',
        forgotPasswordButton: '忘记密码?',
        recoverPasswordButton: '提交',
        goBackButton: '返回',
        confirmPasswordError: '两次输入密码不一致!',
        recoverPasswordIntro: '输入已注册手机号，重置密码',
        recoverPasswordDescription: '重置密码将通过手机 短信 发送到您手机',
        recoverPasswordSuccess: '密码重置成功',
      ),
      theme: LoginTheme(
        // primaryColor: Colors.blueGrey,
        errorColor: Colors.deepOrange,
        pageColorLight: Colors.white,
        pageColorDark: Colors.white,
        titleStyle: TextStyle(
          color: Colors.blueGrey,
          fontFamily: 'OpenSans',
          letterSpacing: 4,
        ),
        beforeHeroFontSize: 50,
        afterHeroFontSize: 20,
        bodyStyle: TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 0.0,
          margin: EdgeInsets.only(top: 10),
          // shape: ContinuousRectangleBorder(
          //     borderRadius: BorderRadius.circular(100.0)),
        ),
        textFieldStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.blueGrey,
          backgroundColor: Colors.blueGrey,
          highlightColor: Colors.blueGrey,
          elevation: 6.0,
          highlightElevation: 6.0,
        ),
      ),
      emailValidator: (value) {
        // if (!value.contains('@') || !value.endsWith('.com')) {
        //   return "Email must contain '@' and end with '.com'";
        // }
        if (value.isEmpty) {
          return '手机不能为空';
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return '密码不能为空';
        }
        return null;
      },
      onLogin: (loginData) {
        return _authUser(loginData);
      },
      onSignup: (loginData) {
        return _authUser(loginData);
      },
      onRecoverPassword: (name) {
        return _recoverPassword(name);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SearchList(),
        ));
      },
    ),
      Container(
      margin: EdgeInsets.only(top: 600),
      child: Row(
        children: [
          //使用图片切图实现自定义的复选框
          // buildCircleCheckBox(),
          SizedBox(width: 1,),
          ///文字区域
          Expanded(
            child: RichText(
              ///文字区域
              text: TextSpan(
                  text: "注册同意",
                  style: TextStyle(color: Color(0xaafafafa)),
                  children: [
                    TextSpan(
                        text: "《用户注册协议》",
                        style: TextStyle(color: Colors.orange),
                        recognizer: _registProtocolRecognizer
                          ..onTap = () {
                            userRegistrationAgreementShowAlertDialog(context);
                          }
                          ),
                    TextSpan(
                      text: "与",
                        style: TextStyle(color: Colors.orange),
                    ),
                    TextSpan(
                        text: "《用户隐私协议》",
                        style: TextStyle(color: Colors.orange),
                        recognizer: _privacyProtocolRecognizer
                          ..onTap = () {
                               userPrivacyAgreementShowAlertDialog(context);
                          }
                          )
                  ]),
            ),
          )
        ],
      )
    )
   ]
 )
    );
  }
}
