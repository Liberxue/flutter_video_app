
import 'package:CiYing/page/login.dart';
import 'package:CiYing/util/store.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;



class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _myListTitle(context,Icons.verified_user,'账户与安全'),

            _myListTitle(context,Icons.hot_tub,'优惠活动'),

            _myListTitle(context,Icons.chat,'联系客服'),

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
  Size get preferredSize => Size(double.infinity, 180);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 20,
              offset: Offset(0, 0)
            )
          ]
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                    onPressed: () {
                        Navigator.pop(context);
                      },
                ),
                Text("个人中心", style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),),

                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white,),
                  onPressed: (){},
                )
              ],
            ),   

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 120,),
                Text("LiberDemo", style: TextStyle(
                color: Colors.white,
                fontSize: 20
               ),),
                 SizedBox(width: 20,),
                 Container(
                      width: 110,
                      height: 32,              
                      child: Center(child: Text("账户充值"),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20
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
                      height: 100,
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
                      color: Colors.white
                    ),),
                    Text("8", style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                    ),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("下载量", style: TextStyle(
                        color: Colors.white
                    ),),
                    Text("12", style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                    ),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("搜索币", style: TextStyle(
                        color: Colors.white
                    ),),
                    Text("4", style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                    ),)
                  ],
                ),           
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class MyClipper extends CustomClipper<Path>{

//   @override
//   Path getClip(Size size) {
//     Path p = Path();

//     p.lineTo(0, size.height-70);//切斜度
//     p.lineTo(size.width, size.height);

//     p.lineTo(size.width, 0);

//     p.close();

//     return p;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }

Widget _myListTitle(BuildContext context,IconData icon,String title) {
  
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        dense: true,
        selected: true,
        // enabled: false,
        // contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
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
     deleteMethod("token");
      Navigator.push(
      context, MaterialPageRoute(builder: (context) => Login(),maintainState: false));
  }