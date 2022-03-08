import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TeacherPortal extends StatefulWidget {
  const TeacherPortal({Key? key}) : super(key: key);

  @override
  State<TeacherPortal> createState() => _TeacherPortalState();
}

class _TeacherPortalState extends State<TeacherPortal> {
  late String title, url;
  bool isLoading = true;

  WebViewState(String title, String url) {
    this.title = title;
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: <Widget>[
          WebView(
            initialUrl: "https://dev.leads.edu.pk/ums/admin/login",
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Stack(),
        ],
      ),
    );
  }
}
