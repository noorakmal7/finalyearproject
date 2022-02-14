import 'package:finalyearproject/newsfeed.dart';
import 'package:finalyearproject/portal.dart';
import 'package:flutter/material.dart';
import 'package:finalyearproject/timetable.dart';

class HomePage extends StatefulWidget {
const HomePage({Key? key}) : super(key: key);

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    NewsFeed(),
    Portal(),
    Timetable(),
  ];
  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 1.5,
      //   centerTitle: true,
      //   foregroundColor: Colors.black,
      //   backgroundColor: Colors.white,
      //   title: Text("NEWS FEED"),
      // ),

      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(48, 62, 105, 1),
        currentIndex: _currentIndex,
        onTap: onTappedBar,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("News Feed"),
            backgroundColor: Colors.white,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("LLU LMS"),
            backgroundColor: Colors.white,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text("TimeTable"),
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}