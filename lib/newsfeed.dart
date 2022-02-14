import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
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
    ),
    );
  }
}