import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _userProfileState createState() => _userProfileState();
}

class _userProfileState extends State<UserProfile>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      // right: 30,
      // bottom: 30,
      width: 50,
      height: 50,
        child: Container(
          width: 50,
          height: 50,
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://avatars0.githubusercontent.com/u/5831248?s=460&u=cfea690871e82c78cd60c9fde9a086e6da6b6d3c&v=4"),
          ),
        ),
    );
  }
}
