import 'package:finalyearproject/screens/homapage.dart';
import 'package:finalyearproject/screens/newsfeed.dart';
import 'package:finalyearproject/timetable/student.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120.0,
            ),
            Image.asset(
              "assets/images/logo.png",
              height: 160,
            ),
            SizedBox(
              height: 40.0,
            ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 16.0, horizontal: 32.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cannot be empty";
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  labelText: "Password",
                  ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  } else if (value.length < 6) {
                    return "Password length should be atleast 6";
                  }

                  return null;
                  },
                 ),
              SizedBox(
                height: 60.0,
                 ),
              SizedBox(
                height: 50,
                width: 140,
                child: RaisedButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage())),
                  },
                  color: Color.fromRGBO(48, 62, 105, 1),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text('Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    ),
                  ),
                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
