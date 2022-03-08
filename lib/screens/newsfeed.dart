import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/CustomWidgets/NewsFeedWidget.dart';
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
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError)
              return Center(child: new Text('Error: ${snapshot.error}'));
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    return new NewsFeedWidget(
                      description: document['description'],
                      title: document['title'],
                      message: document['message'],
                      iconUrl: "assets/images/logo.png",
                      newsUrl: document['newsImageUrl'],
                      date: document['date'],
                      time: document['time'],
                      uniName: 'Lahore Leads University',
                    );
                  }).toList(),
                );
            }
          }),
    );
  }
}
