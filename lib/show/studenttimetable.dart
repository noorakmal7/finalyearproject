import 'package:flutter/material.dart';
import '../CustomWidgets/TimeTableWidget.dart';

class StudentTimeTable extends StatelessWidget {
  const StudentTimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("TimeTable"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 80,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Center(
                              child: Text(
                                "Monday",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TimeTableWidget(
                teacherName: "Sir Waseem Akram",
                roomNo: "B102",
                subjectName: "Cloud Computing",
                timing: "8:30-10:00",
                backgroundColor: Colors.blue,
              ),
              TimeTableWidget(
                teacherName: "Ms. Hina Khan",
                roomNo: "B102",
                subjectName: "Web Development",
                timing: "10:00-11:30",
                backgroundColor: Colors.red,
              ),
              TimeTableWidget(
                teacherName: "Sir Absar",
                roomNo: "B102",
                subjectName: "Mobile App Development",
                timing: "12:00-01:00",
                backgroundColor: Colors.green,
              ),
              TimeTableWidget(
                teacherName: "Sir Tauqeer",
                roomNo: "B102",
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
