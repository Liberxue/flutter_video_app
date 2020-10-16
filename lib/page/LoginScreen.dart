import 'package:CiYing/api/login/login.dart';
import 'package:CiYing/common/constants.dart';
import 'package:CiYing/grpc/proto/gateWay.pbgrpc.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'browse_images.dart';

// const users = const {
//   '123': '123',
//   '1': '1',
// };

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2150);

  Future<String> _authUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    LoginResponse loginResponse = await loginRequest(data.name,data.password);
    print(loginResponse.data.avatarImage);
    return Future.delayed(loginTime).then((_) {
      // if (!users.containsKey(data.name)) {
      //   return '手机号码不存在!';
      // }
      // if (users[data.name] != data.password) {
      //   return '密码不正确!';
      // }
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
      // logo: 'assets/images/logo.png',
      messages: LoginMessages(
        usernameHint: '手机号码',
        passwordHint: '密码',
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
        primaryColor: Colors.blueGrey,
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
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(24.0)),
        ),
        textFieldStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.blueGrey,
          backgroundColor: Colors.blueGrey,
          highlightColor: Colors.blueGrey,
          elevation: 9.0,
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
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _authUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _authUser(loginData);
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },

      // onSubmitAnimationCompleted: () {
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => BrowseImages(),
      //   ));
      // },

      //onSubmitAnimationCompleted: loginRequest("",""),
      //    onSubmitAnimationCompleted: (value) {
      //        loginRequest("18898988899","123456");
      //    },
      // onRecoverPassword: _recoverPassword,
    );
  }
}
