import 'package:finalyearproject/screens/loginpage.dart';
import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>LoginPage()),
        );
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
      title: Text("NEWS FEED"),
      actions: [
        Padding(padding: EdgeInsets.only(right: 10),
          child: PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text("Admin Panel")
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}