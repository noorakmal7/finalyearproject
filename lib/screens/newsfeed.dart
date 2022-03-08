import 'package:finalyearproject/CustomWidgets/NewsFeedWidget.dart';
import 'package:finalyearproject/screens/AddPost.dart';
import 'package:finalyearproject/screens/loginpage.dart';
import 'package:flutter/cupertino.dart';
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
          MaterialPageRoute(builder: (context) => LoginPage()),
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
        title: Text(
          "NEWS FEED",
        ),
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          NewsFeedWidget(
            iconUrl: "assets/images/logo.png",
            uniName: "Lahore Leads University",
            date: "13 Sept 2021",
            time: "04:05 PM",
            newsUrl: "assets/images/news1.PNG",
            title: "Fifth Convocation",
            description:
                "The Honorable Chancellor/Governor Punjab has graciously granted permission to hold the University's 5th Convocation and the Awards Distribution Ceremony. All Graduated Students of notified batches are cordially invited to register for this function. Only registered graduates will be allowed to participate as per schedule to be announced later.",
            message: "Share with Lahore Leads Family.",
          ),
          NewsFeedWidget(
            iconUrl: "assets/images/logo.png",
            uniName: "Lahore Leads University",
            date: "13 Sept 2021",
            time: "04:05 PM",
            newsUrl: "assets/images/update.jpg",
            title: "Updated Timetable F20",
            description:
                "Updated Timetable F18 avaiable on LLU Talib e ILM app. Thank you :)",
            message: "Share with Lahore Leads Family.",
          ),
        ],
      )),
    );
  }
}
