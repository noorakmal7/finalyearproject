import 'package:finalyearproject/timetable/compare.dart';
import 'package:finalyearproject/timetable/student.dart';
import 'package:flutter/material.dart';
import 'package:finalyearproject/homapage.dart';

class Timetable extends StatefulWidget {

  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
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
            Padding(padding: EdgeInsets.only(right: 10),
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(child: Row(
                    children: [
                      Text("Admin Panel")
                    ],
                  ),
                  ),
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
            student(),
            compare(),
          ],
        ),
      ),
    );
  }
}