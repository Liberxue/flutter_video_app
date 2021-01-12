import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtonPageState();
  }
}

class _ButtonPageState extends State<ButtonPage> {
  int _currentIndex = 0;
  // final List<Widget> _children = [Home(), Book(), Music(), Movie()];
  final List<Widget> _children = [];

  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('聚合搜索'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      title: Text('精准搜索'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.music_video),
      title: Text('行为搜索'),
      //backgroundColor: Colors.orange
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: _list,
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
