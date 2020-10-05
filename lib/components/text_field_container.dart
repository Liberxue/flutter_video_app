import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: size.width * 0.7,
      decoration: BoxDecoration(
        // color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: child,
    );
  }
}
