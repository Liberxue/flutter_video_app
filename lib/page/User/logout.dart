import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    Future myDialog(context) {
      return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return GestureDetector(
              // 手势处理事件
              onTap: () {
                Navigator.of(context).pop(); //退出弹出框
              },
              child: Container(
                //弹出框的具体事件
                child: Material(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  child: Center(
                    child: Text(
                      '具体操作',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ));
        },
      );
    }

    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
              myDialog(context);
            },
            //  点击执行弹窗
            child: Center(
              child: Text("弹窗"),
            ),
          ),
        ),
      ),
    );
  }
}

// class Logout extends StatefulWidget {
//   @override
//   _LogoutState createState() => _LogoutState();
// }

// class _LogoutState extends State<Logout> {
//   @override
//   Widget build(BuildContext context) {
//     Future myDialog(context){
//   return showDialog<Null>(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//             return WillPopScope(
//       onWillPop: () async => showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//                 title: Text('你确定要注销吗？'),
//                 actions: <Widget>[
//                   RaisedButton(
//                       child: Text('注销'),
//                       //onPressed: () => Navigator.of(context).pop(true)),
//                     onPressed:() async {
//                         loginOut(context);
//                       }),
//                   RaisedButton(
//                       child: Text('取消'),
//                       onPressed: () => Navigator.of(context).pop(false)),
//                 ],
//               )), child: null,
//           );
//         },
//     );
//   }
//   }
// }

// void loginOut(BuildContext context)async{
//   Cache.deleteCache("token");
//   Navigator.push(
//   context, MaterialPageRoute(builder: (context) => Login(),maintainState: false));
// }
