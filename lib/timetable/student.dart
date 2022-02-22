import 'package:finalyearproject/timetable/studenttimetable.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class student extends StatefulWidget {

  @override
  _studentState createState() => _studentState();
}

class _studentState extends State<student> {
  List<dynamic> departments = [];
  List<dynamic> sections = [];
  List<dynamic> batch = [];
  List<dynamic> days = [];
  List<dynamic> weekdays = [];

  String? departmentId;
  String? sectionId;
  String? dayId;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    this.departments.add({"ID": 1, "label": "CS"});
    this.departments.add({"ID": 2, "label": "MS"});
    this.departments.add({"ID": 3, "label": "ME"});
    this.departments.add({"ID": 4, "label": "CE"});

    this.days = [
      {"day": 1, "weekdays": "Monday"},
      {"day": 2, "weekdays": "Tuesday"},
      {"day": 3, "weekdays": "Wednesday"},
      {"day": 4, "weekdays": "Thursday"},
      {"day": 5, "weekdays": "Friday"},
    ];

    this.sections = [
      {"id": 1, "Batch": "F18-BS(CS)-8-A", "ParentId": 1},
      {"id": 2, "Batch": "F18-BS(CS)-8-B", "ParentId": 1},
      {"id": 3, "Batch": "F18-BS(CS)-8-C", "ParentId": 1},
      {"id": 4, "Batch": "F18-BS(CS)-8-D", "ParentId": 1},
      {"id": 5, "Batch": "F18-BS(CS)-7-A", "ParentId": 1},
      {"id": 6, "Batch": "F18-BS(CS)-7-B", "ParentId": 1},
      {"id": 7, "Batch": "F18-BS(CS)-7-C", "ParentId": 1},
      {"id": 8, "Batch": "F18-BS(CS)-7-D", "ParentId": 1},
      {"id": 9, "Batch": "F18-BS(CS)-6-A", "ParentId": 1},
      {"id": 10, "Batch": "F18-BS(CS)-6-B", "ParentId": 1},
      {"id": 11, "Batch": "F18-BS(CS)-6-C", "ParentId": 1},
      {"id": 12, "Batch": "F18-BS(CS)-5-A", "ParentId": 1},
      {"id": 13, "Batch": "F18-BS(CS)-5-B", "ParentId": 1},
      {"id": 14, "Batch": "F18-BS(CS)-5-C", "ParentId": 1},
      {"id": 15, "Batch": "F18-BS(CS)-4-A", "ParentId": 1},
      {"id": 16, "Batch": "F18-BS(CS)-4-B", "ParentId": 1},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(top: 135.0),
              child: Column(
                children: [
                  FormHelper.dropDownWidget(
                      context,
                      "Select Department",
                      this.departmentId,
                      this.departments,
                      (onChangedVal) {
                        this.departmentId = onChangedVal;

                        this.batch = this.sections.where(
                                (batchItem) => batchItem["ParentId"].toString() == onChangedVal.toString(),
                        )
                        .toList();
                        this.sectionId = null;
                      },
                      (onValidateVal) {
                        if (onValidateVal == null) {
                          return "Select Department";
                        }
                        return null;
                      },
                    borderColor: Color.fromRGBO(48, 62, 105, 1),
                    borderRadius: 12,
                    optionValue: "ID",
                    optionLabel: "label"
                  ),
                  SizedBox(height: 18),
                  FormHelper.dropDownWidget(
                      context,
                      "Section",
                      this.sectionId,
                      this.sections,
                      (onChangedVal) {
                        this.sectionId = onChangedVal;
                        print("Selected Sections: $onChangedVal");
                      },
                      (onValidate){
                        return null;
                      },
                    borderColor: Color.fromRGBO(48, 62, 105, 1),
                    borderRadius: 12,
                      optionValue: "id",
                      optionLabel: "Batch"
                  ),
                  SizedBox(height: 18),
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
                  SizedBox(height: 40),
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
