import 'dart:io';

import 'package:CiYing/common/constants.dart';
import 'package:CiYing/grpc/proto/common.pbenum.dart';
import 'package:CiYing/grpc/proto/gateWay.pbgrpc.dart';
import 'package:CiYing/models/signIn/signIn.dart';
import 'package:CiYing/models/sign_up.dart';
import 'package:CiYing/page/search_list.dart';
import 'package:CiYing/page/userPrivacyAgreement.dart';
import 'package:CiYing/page/userRegistrationAgreement.dart';
import 'package:CiYing/util/exit.dart';
import 'package:CiYing/util/store.dart';
import 'package:CiYing/util/validation.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
class Login extends StatefulWidget {
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> with WidgetsBindingObserver {

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

  }
  
  ///复选框的选中标识
  bool checkIsSelect = false;

  ///使用图片素材自定义圆形自选框
  buildCircleCheckBox() {
    return GestureDetector(
        onTap: () {
          setState(() {
            checkIsSelect = !checkIsSelect;
          });
        },
        child: Image.asset(
          checkIsSelect
                ? "assets/images/no_select_icon.png"
              : "assets/images/select_icon.png",
          width: 18,
          height: 18,
        ),
    );
  }
  SignInResponse _signInResponse;
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 50);
  Future<String> _authUser(LoginData data) async {

    SignInRequest signInRequest =SignInRequest();
    signInRequest.loginType=LoginType.PHONEMESSAGEAUTHCODE;
    signInRequest.passWord=data.password;
    signInRequest.phoneNumber=Int64(int.parse(data.name));

    _signInResponse = await signIn(signInRequest);
    return Future.delayed(loginTime).then((_) async {
      if(_signInResponse.code!=ResponseCode.SUCCESSFUL){
          return "登录失败，请检查账号密码"; // 多语言支持？#issue https://github.com/PomCloud/CiYing/issues/3
      }
      if (_signInResponse==null&&_signInResponse.token.length<1){ //mark check token
        return  "登录异常";
      }
      return null;
    });
  }

  SignUpResponse _signUpResponse;
  Future<String> _singUp(LoginData data)async{
    SignUpRequest signUpRequest=SignUpRequest();
    signUpRequest.phoneNumber=Int64(int.parse(data.name));
    signUpRequest.passWord=data.password;
    _signUpResponse=await signUp(signUpRequest);
      return Future.delayed(loginTime).then((_) async {
      if (_signUpResponse==null&&_signUpResponse.code!=ResponseCode.SUCCESSFUL){ 
        return  "注册异常";
      }
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
        if (value.isEmpty) {
          return '手机不能为空';
        }
        if (!isChinaPhoneLegal(value)){
          return "手机号码格式不正确";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return '密码不能为空';
        }
        if(!checkIsSelect){
          return '请同意用户协议与用户隐私协议';
        }
        return null;
      },
      onLogin: (loginData) {
        return _authUser(loginData);
      },
      onSignup: (loginData) {
        return _singUp(loginData);
      },
      onRecoverPassword: (name) {
        return _recoverPassword(name);
      },
      onSubmitAnimationCompleted: () async {
      await Cache.setCache("token",_signInResponse.token);
      await Cache.setCache("avatarImage", _signInResponse.data.avatarImage);
      print(Cache.getToken());
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SearchList(),
        ));
      },
    ),
  ConstrainedBox(
  constraints: BoxConstraints.expand(),
  child: Stack(
    alignment:Alignment.center,
    children: <Widget>[
      Positioned(
        left: 30.0,
        bottom: 25.0,
        child: buildCircleCheckBox(),
      ),
        Positioned(
         left: 60.0,
          bottom: 25.0,
            child: RichText(
                ///文字区域
                text: TextSpan(
                    text: "勾选",
                    style: TextStyle(color: Colors.orange),
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
    ),
  ),
   ]
 )
    );
  }


@override
  void dispose() {
    super.dispose();
  }
}
