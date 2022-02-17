import 'package:flutter/material.dart';

class StudentTimeTable extends StatelessWidget {
  const StudentTimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 80,
              width: 400,
              margin: const EdgeInsets.only(top: 30.0),
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
                          child: Text("Monday",
                          style:  TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
                ),
              ),
            ),
            Container(
              height: 175,
              width: 400,
              margin: const EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Sir Waseem Akram",
                              style:  TextStyle(
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 170),
                              child: Text("B102",
                                style:  TextStyle(
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 36,bottom: 30),
                          child: Center(
                            child: Text("Cloud Computing",
                              style:  TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Center(
                          child: Text("8:30-10:00",
                            style:  TextStyle(
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 175,
              width: 400,
              margin: const EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Ms.Hina Kiran",
                              style:  TextStyle(
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 205),
                              child: Text("B102",
                                style:  TextStyle(
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 36,bottom: 30),
                          child: Center(
                            child: Text("Web Development",
                              style:  TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Center(
                          child: Text("8:30-10:00",
                            style:  TextStyle(
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 175,
              width: 400,
              margin: const EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Sir Absar",
                              style:  TextStyle(
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 240),
                              child: Text("B102",
                                style:  TextStyle(
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 36,bottom: 30),
                          child: Center(
                            child: Text("Mobile App Development",
                              textAlign: TextAlign.end,
                              style:  TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Center(
                          child: Text("10:00-11:30",
                            style:  TextStyle(
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
