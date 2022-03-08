import 'package:finalyearproject/DateSheet/StudentDS.dart';
import 'package:flutter/material.dart';

import '../screens/loginpage.dart';

class DateSheet extends StatefulWidget {
  @override
  _DateSheetState createState() => _DateSheetState();
}

class _DateSheetState extends State<DateSheet> {
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
          title: Text("Date Sheet"),
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
        ),
        body: StudentDS(),
      ),
    );
  }
}
