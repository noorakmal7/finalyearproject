import 'package:file_picker/file_picker.dart';
import 'package:finalyearproject/screens/AddPost.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../Api/firebase_api.dart';
import 'package:path/path.dart';

class AdminPortal extends StatefulWidget {
  @override
  _AdminPortalState createState() => _AdminPortalState();
}

class _AdminPortalState extends State<AdminPortal> {
  UploadTask? task;
  File? timeTable;
  File? dateSheet;

  List<String> dateSheetFilesPath = [];
  List<String> timeTableFilesPath = [];

  void reteriveFilePaths() async {
    var storage = FirebaseStorage.instance;

    ListResult result = await storage.ref("DateSheet").list();
    List<Reference> allFiles = result.items;
    await Future.forEach<Reference>(allFiles, (file) async {
      String fullPath = file.fullPath;
      int index = fullPath.indexOf("/");
      String path = fullPath.substring(index + 1, fullPath.length);
      print(path);
      setState(() {
        dateSheetFilesPath.add(path);
      });
    });

    result = await storage.ref("TimeTable").list();
    allFiles = result.items;
    await Future.forEach<Reference>(allFiles, (file) async {
      String fullPath = file.fullPath;
      int index = fullPath.indexOf("/");
      String path = fullPath.substring(index + 1, fullPath.length);
      print(path);
      setState(() {
        timeTableFilesPath.add(path);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    reteriveFilePaths();
  }

  void onSelected(BuildContext context, int item) {
    String ttFileName =
        timeTable != null ? basename(timeTable!.path) : 'No File Selected';

    String dsFileName =
        dateSheet != null ? basename(dateSheet!.path) : 'No File Selected';

    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddPost()),
        );
        break;
      case 1:
        selectFile(timeTable, ttFileName, 1);
        print('Add TimeTable');
        break;
      case 2:
        selectFileToUpdate(timeTable, ttFileName, 1);
        print('Update TimeTable');
        break;
      case 3:
        selectFile(dateSheet, dsFileName, 2);
        print('Add DateSheet');
        break;
      case 4:
        selectFileToUpdate(dateSheet, dsFileName, 2);
        print('Update DateSheet');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Admin Portal",
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem(value: 0, child: Text("Add Post")),
                PopupMenuItem(value: 1, child: Text("Add TimeTable")),
                PopupMenuItem(value: 2, child: Text("Update TimeTable")),
                PopupMenuItem(value: 3, child: Text("Add DateSheet")),
                PopupMenuItem(value: 4, child: Text("Update DateSheet")),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }

  Future selectFile(File? file, String fileName, int cTask) async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
    String s = await uploadFile(file, fileName, cTask);
    return s;
  }

  Future selectFileToUpdate(File? file, String fileName, int cTask) async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
    String s = await updateFile(file, fileName, cTask);
    return s;
  }

  bool isExists(String path, List list) {
    for (String i in list) {
      if (i == path) {
        return true;
      }
    }
    return false;
  }

  Future uploadFile(File? file, String fileName, int cTask) async {
    if (file == null) return;

    fileName = basename(file.path);
    print("File $fileName");
    var destination = 'TimeTable/$fileName';
    if (cTask == 2) {
      if (isExists(fileName, dateSheetFilesPath)) {
        showSnack("File already exists. Please change file or update.");
        return;
      }
      destination = 'DateSheet/$fileName';
    } else {
      if (isExists(fileName, timeTableFilesPath)) {
        showSnack("File already exists. Please change file or update.");
        return;
      }
    }

    showSnack("File uploading...");
    task = FirebaseApi.uploadFile(destination, file);
    setState(() {
      fileName = basename(file.path);
    });

    if (task == null) {
      showSnack("Something went wrong!");
      return;
    }

    final snapshot = await task!.whenComplete(() {
      showSnack("File uploaded.");
    });
    final urlDownload = await snapshot.ref.getDownloadURL();

    return urlDownload;
  }

  Future updateFile(File? file, String fileName, int cTask) async {
    if (file == null) return;

    fileName = basename(file.path);
    print("File $fileName");
    var destination = 'TimeTable/$fileName';
    if (cTask == 2) {
      if (!isExists(fileName, dateSheetFilesPath)) {
        showSnack("File doesn't exists. Please select appropriate file.");
        return;
      }
      destination = 'DateSheet/$fileName';
    } else {
      if (!isExists(fileName, timeTableFilesPath)) {
        showSnack("File doesn't exists. Please select appropriate file.");
        return;
      }
    }

    showSnack("File updating...");
    task = FirebaseApi.uploadFile(destination, file);
    setState(() {
      fileName = basename(file.path);
    });

    if (task == null) {
      showSnack("Something went wrong!");
      return;
    }

    final snapshot = await task!.whenComplete(() {
      showSnack("File updated.");
    });
    final urlDownload = await snapshot.ref.getDownloadURL();

    return urlDownload;
  }

  void showSnack(String message) {
    var snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(this.context).showSnackBar(snackBar);
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return AlertDialog(
              title: Text(
                'Uploading $percentage %',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return Container();
          }
        },
      );
}
