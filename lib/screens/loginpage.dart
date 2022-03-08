import 'package:finalyearproject/portal/AdminPortal.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final emailFormKey = new GlobalKey<FormState>();
  final passwordFormKey = new GlobalKey<FormState>();

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
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  Form(
                    key: emailFormKey,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        labelText: "Email",
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  Form(
                    key: passwordFormKey,
                    child: TextFormField(
                      controller: passwordController,
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password ?",
                        style: TextStyle(
                            color: Color.fromRGBO(48, 62, 105, 1),
                            letterSpacing: 0.2),
                      )),
                  SizedBox(
                    height: 60.0,
                  ),
                  SizedBox(
                    height: 50,
                    width: 140,
                    child: RaisedButton(
                      onPressed: () {
                        final emailState = emailFormKey.currentState;
                        final passwordState = passwordFormKey.currentState;
                        if (emailState!.validate() &&
                            passwordState!.validate()) {
                          if (emailController.value.text == "lluadmin@llu.com" &&
                              passwordController.value.text ==
                                  "123456") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminPortal()));
                          }
                        }
                      },
                      color: Color.fromRGBO(48, 62, 105, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        'Login',
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
