import 'package:finalyearproject/portal/studentportal.dart';
import 'package:finalyearproject/portal/teacherportal.dart';
import 'package:flutter/material.dart';

import '../screens/loginpage.dart';

class Portal extends StatelessWidget {
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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text("LLU LMS"),
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
              Tab(text: "STUDENT"),
              Tab(text: "TEACHER"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StudentPortal(),
            TeacherPortal(),
          ],
        ),
      ),
    );
  }
}
