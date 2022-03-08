import 'package:flutter/material.dart';

class NewsFeedWidget extends StatelessWidget {
  late String iconUrl;
  late String uniName;
  late String date;
  late String time;
  late String newsUrl;
  late String title;
  late String description;
  late String message;

  NewsFeedWidget(
      {required this.iconUrl,
      required this.uniName,
      required this.date,
      required this.time,
      required this.newsUrl,
      required this.title,
      required this.description,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    iconUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    uniName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        time,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(2, 1.8),
                    spreadRadius: 3.0,
                    blurRadius: 5.0),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                newsUrl,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset(2, 1.8),
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ]),
            margin: EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 8),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
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
