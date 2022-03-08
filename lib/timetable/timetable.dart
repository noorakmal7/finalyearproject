import 'package:flutter/material.dart';
import 'package:finalyearproject/timetable/compare.dart';
import 'package:finalyearproject/timetable/student.dart';
import 'package:finalyearproject/timetable/teacher.dart';

import '../screens/loginpage.dart';

class Timetable extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text("Time Table"),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: PopupMenuButton<int>(
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem(value: 0, child: Text("Admin Panel")),
                ],
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Color.fromRGBO(254, 203, 41, 1),
            labelColor: Colors.black,
            tabs: [
              Tab(text: "STUDENT'S"),
              Tab(text: "TEACHER'S"),
              Tab(text: "COMPARE"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            student(),
            teacher(),
            compare(),
          ],
        ),
      ),
    );
  }
}
