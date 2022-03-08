import 'package:finalyearproject/show/studenttimetable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../show/StudentDateSheet.dart';

class teacher extends StatefulWidget {
  @override
  _teacherState createState() => _teacherState();
}

class _teacherState extends State<teacher> {
  TextEditingController teacherController = TextEditingController();
  List<dynamic> teachers = [];
  List<dynamic> days = [];
  List<dynamic> weekdays = [];

  String? teacherId;
  String? dayId;
  Color _color = Colors.grey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.days = [
      {"day": 1, "weekdays": "Monday"},
      {"day": 2, "weekdays": "Tuesday"},
      {"day": 3, "weekdays": "Wednesday"},
      {"day": 4, "weekdays": "Thursday"},
      {"day": 5, "weekdays": "Friday"},
      {"day": 6, "weekdays": "Saturday"},
      {"day": 7, "weekdays": "Sunday"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 150.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(18),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Teacher Name",
                    labelText: "Teacher's name",
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(254, 203, 41, 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(254, 203, 41, 1), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  controller: teacherController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Teacher details cannot be empty";
                    } else {
                      teacherId = value;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 28),
              FormHelper.dropDownWidget(
                context,
                "Days",
                this.dayId,
                this.days,
                (onChangedVal) {
                  this.dayId = onChangedVal;
                  print("SelectedDays: $onChangedVal");
                  if (teacherController.value.text.isNotEmpty) {
                    setState(() {
                      _color = Color.fromRGBO(254, 203, 41, 1);
                    });
                  }
                },
                (onValidate) {
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
                    if (teacherController.value.text.isNotEmpty &&
                        this.dayId != null)
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentTimeTable())),
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
