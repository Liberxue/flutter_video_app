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
                image: NetworkImage("https://avatars0.githubusercontent.com/u/5831248?s=460&u=cfea690871e82c78cd60c9fde9a086e6da6b6d3c&v=4"),
                )
            )
        ),
   );
  }
}
