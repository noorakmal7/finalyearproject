import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StudentPortal extends StatefulWidget {
  const StudentPortal({Key? key}) : super(key: key);

  @override
  State<StudentPortal> createState() => _StudentPortalState();
}

class _StudentPortalState extends State<StudentPortal> {

  late String title,url;
  bool isLoading=true;

  WebViewState(String title,String url){
    this.title=title;
    this.url=url;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: <Widget>[
          WebView(
            zoomEnabled: true,
            initialUrl: "https://sp.leads.edu.pk/",
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      ),
    );
  }

}
