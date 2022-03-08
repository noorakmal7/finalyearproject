import 'package:finalyearproject/portal/studentportal.dart';
import 'package:flutter/material.dart';

class Portal extends StatelessWidget {

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
              Tab(text: "STUDENT"),
              Tab(text: "TEACHER"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StudentPortal(),
            StudentPortal(),
          ],
        ),
      ),
    );
  }
}