import 'package:flutter/material.dart';

class CategoryDropMenu extends StatefulWidget {
  @override
  _CategoryDropMenu createState() => new _CategoryDropMenu();
}

class _CategoryDropMenu extends State<CategoryDropMenu> {

  String dropdownValue = "全部语言";

  @override
  Widget build(BuildContext context){
    return new DropdownButtonHideUnderline(child:
      new DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['全部语言', '英语', '日语', '韩语']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
      ));
  }

}