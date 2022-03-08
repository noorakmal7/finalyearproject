import 'package:finalyearproject/CustomWidgets/DateSheetWidget.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/TimeTableWidget.dart';

class StudentDateSheet extends StatelessWidget {
  const StudentDateSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("DateSheet"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              DateSheetWidget(
                teacherName: "Sir Waseem Akram",
                roomNo: "B102",
                subjectName: "Cloud Computing",
                timing: "8:30-10:00",
                section: "A",
                backgroundColor: Colors.blue,
              ),
              DateSheetWidget(
                teacherName: "Ms. Hina Khan",
                roomNo: "B102",
                subjectName: "Web Development",
                section: "A",
                timing: "10:00-11:30",
                backgroundColor: Colors.red,
              ),
              DateSheetWidget(
                teacherName: "Sir Absar",
                roomNo: "B102",
                section: "A",
                subjectName: "Mobile App Development",
                timing: "12:00-01:00",
                backgroundColor: Colors.green,
              ),
              DateSheetWidget(
                teacherName: "Sir Tauqeer",
                roomNo: "B102",
                section: "A",
                subjectName: "Soft Computing",
                timing: "01:00-02:00",
                backgroundColor: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
