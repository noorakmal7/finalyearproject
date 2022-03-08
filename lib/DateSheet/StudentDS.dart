import 'package:finalyearproject/show/StudentDateSheet.dart';
import 'package:finalyearproject/show/studenttimetable.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class StudentDS extends StatefulWidget {
  @override
  _StudentDSState createState() => _StudentDSState();
}

class _StudentDSState extends State<StudentDS> {
  List<dynamic> departments = [];
  List<dynamic> sections = [];
  List<dynamic> batch = [];
  List<dynamic> days = [];
  List<dynamic> weekdays = [];
  List<dynamic> selectedSections = [];

  String? departmentId;
  String? sectionId;
  String? dayId;

  Color _color = Colors.grey;

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
      {"day": 6, "weekdays": "Saturday"},
      {"day": 7, "weekdays": "Sunday"},

    ];

    this.sections = [
      {"id": 1, "Batch": "F18-BS(CS)-8-A", "ParentId": 1, "Department": "CS"},
      {"id": 2, "Batch": "F18-BS(CS)-8-B", "ParentId": 1, "Department": "CS"},
      {"id": 3, "Batch": "F18-BS(CS)-8-C", "ParentId": 1, "Department": "CS"},
      {"id": 4, "Batch": "F18-BS(CS)-8-D", "ParentId": 1, "Department": "CS"},
      {"id": 5, "Batch": "F18-BS(MS)-7-A", "ParentId": 1, "Department": "MS"},
      {"id": 6, "Batch": "F18-BS(MS)-7-B", "ParentId": 1, "Department": "MS"},
      {"id": 7, "Batch": "F18-BS(MS)-7-C", "ParentId": 1, "Department": "MS"},
      {"id": 8, "Batch": "F18-BS(MS)-7-D", "ParentId": 1, "Department": "MS"},
      {"id": 9, "Batch": "F18-BS(ME)-6-A", "ParentId": 1, "Department": "ME"},
      {"id": 10, "Batch": "F18-BS(ME)-6-B", "ParentId": 1, "Department": "ME"},
      {"id": 11, "Batch": "F18-BS(ME)-6-C", "ParentId": 1, "Department": "ME"},
      {"id": 12, "Batch": "F18-BS(ME)-5-A", "ParentId": 1, "Department": "ME"},
      {"id": 13, "Batch": "F18-BS(CE)-5-B", "ParentId": 1, "Department": "CE"},
      {"id": 14, "Batch": "F18-BS(CE)-5-C", "ParentId": 1, "Department": "CE"},
      {"id": 15, "Batch": "F18-BS(CE)-4-A", "ParentId": 1, "Department": "CE"},
      {"id": 16, "Batch": "F18-BS(CE)-4-B", "ParentId": 1, "Department": "CE"},
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
              FormHelper.dropDownWidget(context, "Select Department",
                  this.departmentId, this.departments, (onChangedVal) {
                this.departmentId = onChangedVal;
                print(departments[int.parse(onChangedVal) - 1]["label"]);
                setState(() {
                  this.selectedSections = this
                      .sections
                      .where(
                        (batchItem) =>
                            batchItem["Department"].toString() ==
                            departments[int.parse(onChangedVal) - 1]["label"],
                      )
                      .toList();
                });

                this.sectionId = null;
              }, (onValidateVal) {
                if (onValidateVal == null) {
                  return "Select Department";
                }
                return null;
              },
                  borderColor: Color.fromRGBO(48, 62, 105, 1),
                  borderRadius: 12,
                  optionValue: "ID",
                  optionLabel: "label"),
              SizedBox(height: 18),
              FormHelper.dropDownWidget(
                  context, "Section", this.sectionId, this.selectedSections,
                  (onChangedVal) {
                this.sectionId = onChangedVal;
                print("Selected Sections: $onChangedVal");
              }, (onValidate) {
                return null;
              },
                  borderColor: Color.fromRGBO(48, 62, 105, 1),
                  borderRadius: 12,
                  optionValue: "id",
                  optionLabel: "Batch"),
              SizedBox(height: 18),
              FormHelper.dropDownWidget(
                context,
                "Days",
                this.dayId,
                this.days,
                (onChangedVal) {
                  this.dayId = onChangedVal;
                  if (this.departmentId != null && this.sectionId != null) {
                    setState(() {
                      _color = Color.fromRGBO(254, 203, 41, 1);
                    });
                  }
                  print("SelectedDays: $onChangedVal");
                },
                (onValidate) {
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
                    if (this.departmentId != null && this.sectionId != null)
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentDateSheet())),
                      }
                  },
                  color: _color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(80))),
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
