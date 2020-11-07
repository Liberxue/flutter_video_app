
import 'package:CiYing/page/login.dart';
import 'package:CiYing/util/store.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
    //  margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 2,vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomHeadeBar(),
            _myListTitle(context,Icons.verified_user,'账户安全'),

            _myListTitle(context,Icons.hot_tub,'优惠活动'),

            _myListTitle(context,Icons.chat,'联系客服'),

            _myListTitle(context,Icons.lock,'隐私设置'),

            _myListTitle(context,Icons.chat_bubble,'关于我们'),

            _myListTitle(context,Icons.login_outlined,'退出登录'),
          ],
        ),
      ),
    );
  }
}


final String url = "https://avatars0.githubusercontent.com/u/5831248?s=460&u=cfea690871e82c78cd60c9fde9a086e6da6b6d3c&v=4";

class CustomAppBar extends StatelessWidget
  with PreferredSizeWidget{
  @override
  Size get preferredSize => Size(double.infinity, 40);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
        title: Container(
          // color: Colors.white10,
          child:Text("个人中心", style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white,),     
            // tooltip: 'Restitch it',
            onPressed: null,
          ),
        ], // 左侧返回按钮，可以有按钮，可以有文字
        // backgroundColor: Colors.red, //导航栏和状态栏的的颜色
        elevation: 0.0, //阴影的高度
        brightness: Brightness.light, //控制状态栏的颜色，lignt 文字是灰色的，dark是白色的
        textTheme: TextTheme(), //这个主题的参数比较多,flutter定义了13种不同的字体样式
        centerTitle: true, //标题是否居中，默认为false
        toolbarOpacity: 0.5, //整个导航栏的不透明度
        bottomOpacity: 0.8, //bottom的不透明度
        titleSpacing: 10, //标题两边的空白区域,
      );          
  }
}
class CustomHeadeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // clipper: MyClipper(),
      
        child: Column(
          children: <Widget>[  
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 120, 
                 height: 50,),
                Text("LiberDemo", style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 20
               ),),
                 SizedBox(width: 30,),
                 Container(
                      width: 110,
                      height: 30,  
                      child: Center(child: Text("账户充值", style: TextStyle(
                        color:Color.fromRGBO(102, 51, 0, 0.9),
                        fontSize: 14
                      )),),
                      decoration: BoxDecoration(
                        color:Color.fromRGBO(255, 178, 102, 0.9),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 5
                          )
                        ]
                      ),
                    ),
              ]
             // ),
            ),         
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                 Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(url)
                          )
                      ),
                    ),
                  ],
                ),
                
                Column(
                  children: <Widget>[
                    Text("收藏夹", style: TextStyle(
                      color: Colors.blueGrey
                    ),),
                    Text("8", style: TextStyle(
                        fontSize: 26,
                        color: Colors.blueGrey
                    ),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("下载量", style: TextStyle(
                        color: Colors.blueGrey
                    ),),
                    Text("12", style: TextStyle(
                        fontSize: 26,
                        color: Colors.blueGrey
                    ),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("搜索币", style: TextStyle(
                        color: Colors.blueGrey
                    ),),
                    Text("4", style: TextStyle(
                        fontSize: 26,
                        color:Color.fromRGBO(102, 51, 0, 0.9),
                    ),)
                  ],
                ),           
              ],
            ),
          ],
        ),
      );
  }
}
class MyClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height-20);//切斜度
    p.lineTo(size.width, size.height);

    p.lineTo(size.width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget _myListTitle(BuildContext context,IconData icon,String title) {
  
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.only(top: 13),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        dense: true,
        selected: true,
        // enabled: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
        trailing: Icon(Icons.chevron_right),
         onTap: (){
          // Navigator.push(
          //  context, MaterialPageRoute(builder: (context) => ProfilePage(),maintainState: false));
          print(title);
          if (title=="退出登录"){
            loginOut(context);
          }
        },
        // onLongPress: (){
          // do something else
       // },
      ),

    );

  }
   void loginOut(BuildContext context)async{
     Cache.deleteCache("token");
      Navigator.push(
      context, MaterialPageRoute(builder: (context) => Login(),maintainState: false));
  }