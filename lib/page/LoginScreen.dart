import 'package:CiYing/common/constants.dart';
import 'package:CiYing/grpc/proto/common.pbenum.dart';
import 'package:CiYing/grpc/proto/gateWay.pbgrpc.dart';
import 'package:CiYing/models/signIn/signIn.dart';
import 'package:CiYing/page/search_list.dart';
import 'package:CiYing/util/store.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';


class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 50);
  Future<String> _authUser(LoginData data) async {
    SignInRequest signInRequest =SignInRequest();
    signInRequest.loginType=LoginType.PHONEMESSAGEAUTHCODE;
    signInRequest.passWord=data.password;
    signInRequest.phoneNumber=Int64(int.parse(data.password));
    SignInResponse signInResponse = await signIn(signInRequest);
   return Future.delayed(loginTime).then((_) {
    print(signInResponse.code);
    print(signInResponse.data.avatarImage);
    print(signInResponse.token);
    saveMethod("token",signInResponse.token);
 
    if(signInResponse.code!=ResponseCode.SUCCESSFUL){
        return "登录失败，请检查账号密码";// 多语言支持？#issue https://github.com/PomCloud/CiYing/issues/3
    }
    if (signInResponse.token.length<1){
      return  "登录异常";
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
    return FlutterLogin(
      title: APPNAME,
      logo: 'assets/images/logo.png',
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
      
    );
  }
}