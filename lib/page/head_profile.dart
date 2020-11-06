import 'package:flutter/material.dart';

class UserHeaderProfile extends StatefulWidget {
  @override
  _UserHeaderProfileState createState() => _UserHeaderProfileState();
}

class _UserHeaderProfileState extends State<UserHeaderProfile>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: (){
              Navigator.pushNamed(context, '/UserProfile');
          // Navigator.push(
          //  context, MaterialPageRoute(builder: (context) => UserProfile(),maintainState: false));
        },
          child:Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"),
                )
            )
        ),
   );
  }
}
