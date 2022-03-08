import 'package:finalyearproject/DateSheet/CompareDS.dart';
import 'package:finalyearproject/DateSheet/StudentDS.dart';
import 'package:finalyearproject/DateSheet/TeacherDS.dart';
import 'package:flutter/material.dart';

class DateSheet extends StatefulWidget {
  @override
  _DateSheetState createState() => _DateSheetState();
}

class _DateSheetState extends State<DateSheet> {
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
          title: Text("Date Sheet"),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [Text("Admin Panel")],
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
            StudentDS(),
            TeacherDS(),
            CompareDS(),
          ],
        ),
      ),
    );
  }
}
