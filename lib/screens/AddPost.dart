import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:finalyearproject/Util/Post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../Api/firebase_api.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String dateTime = "Select Date & Time";
  UploadTask? task;
  File? iconFile;
  File? newsFile;

  String? cDate;
  String? time;
  String? iconImageUrl;
  String? newsImageUrl;

  CollectionReference postCollection =
      FirebaseFirestore.instance.collection('Posts');

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String iconMessage = "No file selected";
  String newsMessage = "No file selected";

  @override
  Widget build(BuildContext context) {
    String iconFileName =
        iconFile != null ? basename(iconFile!.path) : 'No File Selected';

    String newsFileName =
        newsFile != null ? basename(newsFile!.path) : 'No File Selected';

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Add Post"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Enter title",
                  labelText: "Title",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter description",
                  labelText: "Description",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Description cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: "Enter message",
                  labelText: "Message",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Message cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                    onPressed: () async {
                      iconImageUrl =
                          await selectFile(iconFile, iconFileName, 1);
                      print("Url for icon file : $iconImageUrl");
                    },
                    color: Colors.blue,
                    child: Text(
                      "Select icon",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Text(
                iconMessage,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                    onPressed: () async {
                      newsImageUrl =
                          await selectFile(newsFile, newsFileName, 2);
                      print("Url for news file : $newsImageUrl");
                    },
                    color: Colors.blue,
                    child: Text(
                      "Select news image",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Text(
                newsMessage,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true, onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      String formatted =
                          DateFormat('d MMMM y , kk:mm').format(date);
                      int index = formatted.indexOf(",");
                      cDate = formatted.substring(0, index);
                      time = formatted.substring(index + 1, formatted.length);
                      setState(() {
                        dateTime = "Date: " + cDate! + " Time: " + time!;
                      });
                      print("Date : " + cDate!);
                      print("Time : " + time!);
                    }, currentTime: DateTime.now());
                  },
                  child: Text(
                    dateTime,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 60.0,
              ),
              SizedBox(
                height: 50,
                width: 140,
                child: RaisedButton(
                  onPressed: () => {
                    if (titleController.value.text.isNotEmpty &&
                        descriptionController.value.text.isNotEmpty &&
                        messageController.value.text.isNotEmpty &&
                        iconImageUrl.toString().isNotEmpty &&
                        newsImageUrl.toString().isNotEmpty &&
                        cDate.toString().isNotEmpty &&
                        time.toString().isNotEmpty)
                      {
                        addPost(),
                      }
                    else
                      {
                        showSnack("Please check input fields or images"),
                      }
                  },
                  color: Color.fromRGBO(48, 62, 105, 1),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'Add Post',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile(File? file, String fileName, int cTask) async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() {
      cTask == 1
          ? this.iconMessage = "Icon uploading..."
          : this.newsMessage = "Image uploading...";
    });

    setState(() => file = File(path));
    String s = await uploadFile(file, fileName, cTask);
    return s;
  }

  Future uploadFile(File? file, String fileName, int cTask) async {
    if (file == null) return;

    fileName = basename(file.path);
    final destination = 'images/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {
      fileName = basename(file.path);
    });

    if (task == null) {
      showSnack("Something went wrong!");
      return;
    }

    final snapshot = await task!.whenComplete(() {
      setState(() {
        cTask == 1
            ? this.iconMessage = "Icon uploaded"
            : this.newsMessage = "Image uploaded";
      });
    });
    final urlDownload = await snapshot.ref.getDownloadURL();

    return urlDownload;
  }

  Future<void> addPost() {
    showSnack("Adding News");
    return postCollection
        .add(new Post(
          title: titleController.value.text,
          description: descriptionController.value.text,
          message: messageController.value.text,
          iconImageUrl: iconImageUrl.toString(),
          newsImageUrl: newsImageUrl.toString(),
          date: cDate.toString(),
          time: time.toString(),
        ).toJson())
        .then((value) => showSnack('News Added.'))
        .catchError((error) => print("Failed to add news: $error"));
  }

  void showSnack(String message) {
    var snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(this.context).showSnackBar(snackBar);
  }
}
