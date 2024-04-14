import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.person),
    Icon(Icons.notifications),
    Icon(Icons.article),
    Icon(Icons.insert_chart),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int nextIndex){
          setState(() {
            _currentIndex = nextIndex;
          });
        },
        items: const[

          BottomNavigationBarItem(label: "Profile",icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: "Chart",icon: Icon(Icons.insert_chart)),
          BottomNavigationBarItem(label: "Home",icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Notification",icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(label: "Article",icon: Icon(Icons.article)),

        ],

        selectedItemColor: buttonColor,
        unselectedItemColor: grey,
      ),
    );
  }
}