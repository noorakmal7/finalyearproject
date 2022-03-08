import 'package:finalyearproject/screens/AddPost.dart';
import 'package:flutter/material.dart';

class AdminPortal extends StatefulWidget {
  @override
  _AdminPortalState createState() => _AdminPortalState();
}

class _AdminPortalState extends State<AdminPortal> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddPost()),
        );
        break;
      case 1:
        print('Add/Update TimeTable');
        break;
      case 2:
        print('Add/Update DateSheet');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Admin Portal",
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem(value: 0, child: Text("Add Post")),
                PopupMenuItem(value: 1, child: Text("Add/Update TimeTable")),
                PopupMenuItem(value: 2, child: Text("Add/Update DateSheet")),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(),
    );
  }
}
