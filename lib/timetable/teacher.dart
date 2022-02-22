import 'package:finalyearproject/timetable/studenttimetable.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class teacher extends StatefulWidget {

  @override
  _teacherState createState() => _teacherState();
}

class _teacherState extends State<teacher> {
  List<dynamic> teachers = [];
  List<dynamic> days = [];
  List<dynamic> weekdays = [];

  String? teacherId;
  String? dayId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.teachers.add({"teacherID": 1, "label": "Mr Waseem"});
    this.teachers.add({"teacherID": 2, "label": "Ms Sobia"});
    this.teachers.add({"teacherID": 3, "label": "Mr Zubair"});
    this.teachers.add({"teacherID": 4, "label": "Mr Adnan"});
    this.teachers.add({"teacherID": 5, "label": "Mr Absar"});
    this.teachers.add({"teacherID": 6, "label": "Ms Hina"});

    this.days = [
      {"day": 1, "weekdays": "Monday"},
      {"day": 2, "weekdays": "Tuesday"},
      {"day": 3, "weekdays": "Wednesday"},
      {"day": 4, "weekdays": "Thursday"},
      {"day": 5, "weekdays": "Friday"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 185.0),
              child: Column(
                children: [
                  FormHelper.dropDownWidget(
                      context,
                      "Select Teacher",
                      this.teacherId,
                      this.teachers,
                          (onChangedVal) {
                        this.teacherId = onChangedVal;

                        this.days = this.weekdays.where(
                              (batchItem) => batchItem["ParentId"].toString() == onChangedVal.toString(),
                        )
                            .toList();
                        this.teacherId = null;
                      },
                          (onValidateVal) {
                        if (onValidateVal == null) {
                          return "Select Teacher";
                        }
                        return null;
                      },
                      borderColor: Color.fromRGBO(48, 62, 105, 1),
                      borderRadius: 12,
                      optionValue: "teacherID",
                      optionLabel: "label"
                  ),
                  // SizedBox(height: 18),
                  // FormHelper.dropDownWidget(
                  //     context,
                  //     "Section",
                  //     this.sectionId,
                  //     this.sections,
                  //         (onChangedVal) {
                  //       this.sectionId = onChangedVal;
                  //       print("Selected Sections: $onChangedVal");
                  //     },
                  //         (onValidate){
                  //       return null;
                  //     },
                  //     borderColor: Color.fromRGBO(254, 203, 41, 1),
                  //     borderRadius: 12,
                  //     optionValue: "id",
                  //     optionLabel: "Batch"
                  // ),
                  SizedBox(height: 28),
                  FormHelper.dropDownWidget(
                    context,
                    "Days",
                    this.dayId,
                    this.days,
                        (onChangedVal) {
                      this.dayId = onChangedVal;
                      print("SelectedDays: $onChangedVal");
                    },
                        (onValidate){
                      return null;
                    },
                    borderColor: Color.fromRGBO(48, 62, 105, 1),
                    borderRadius: 12,
                    optionValue: "day",
                    optionLabel: "weekdays",
                  ),
                  SizedBox(height: 65),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: RaisedButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StudentTimeTable())),
                      },
                      color: Color.fromRGBO(254, 203, 41, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(80))
                      ),
                      child: new Text('SHOW'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
