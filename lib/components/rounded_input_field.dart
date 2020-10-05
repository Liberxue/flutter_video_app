import 'package:CiYing/common/constants.dart';
import 'package:CiYing/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchQueryController = TextEditingController();
    return TextFieldContainer(
      child: TextField(
          cursorWidth: 2.0,
          cursorRadius: Radius.circular(5.0),
          controller: searchQueryController,
          maxLines: 1,
          onChanged: onChanged,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            labelText: APPNAME + hintText,
            labelStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
                color: kPrimaryColor,
                fontSize: 12.0),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            )),
          )),
    );
  }
}
