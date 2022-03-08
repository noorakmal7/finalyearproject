import 'package:flutter/material.dart';

class DateSheetWidget extends StatelessWidget {
  String teacherName;
  String subjectName;
  String timing;
  String roomNo;
  String section;
  Color backgroundColor;

  DateSheetWidget(
      {required this.teacherName,
      required this.subjectName,
      required this.timing,
      required this.section,
      required this.roomNo,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        teacherName,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        roomNo,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36, bottom: 30),
                  child: Center(
                    child: Text(
                      subjectName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      timing,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "Section $section",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
