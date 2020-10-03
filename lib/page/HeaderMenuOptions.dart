import 'package:flutter/material.dart';

class HeaderMenuOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 13),
              child: RaisedButton(
                elevation: 0.5,
                color: Colors.blueAccent,
                onPressed: () {},
                child: Text(
                  '登录',
                  style: TextStyle(
                      fontFamily: 'arial',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
