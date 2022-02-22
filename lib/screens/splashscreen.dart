import 'package:finalyearproject/screens/newsfeed.dart';
import 'package:finalyearproject/portal/portal.dart';
import 'package:finalyearproject/show/studentportal.dart';
import 'package:finalyearproject/screens/timetable.dart';
import 'package:flutter/material.dart';
import 'package:finalyearproject/screens/homapage.dart';





class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 3000), () {} );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 62, 105, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",
              height: 200,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "LLU Talib-e-Ilm App",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}