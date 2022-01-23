// ignore_for_file: prefer_const_constructors

import 'package:easydorm/student_files/text_field.dart';
import 'package:easydorm/student_files/user_data.dart';
import 'package:easydorm/student_files/user_student.dart';
import 'package:easydorm/constants.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/student_files/profile.dart';

class WeditPage extends StatefulWidget {
  final studentId;
  const WeditPage({Key? key, required this.studentId}) : super(key: key);

  @override
  _WeditPageState createState() => _WeditPageState();
}

class _WeditPageState extends State<WeditPage> {
  MyUser user = Userpref.myUser;
  Size screen() {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontFamily: "Oxygen",
            fontSize: 24,
          ),
        ),
        backgroundColor: primaryPurple,
      ),
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Profile(
            image: user.imagePath,
            isEdit: true,
            onClicked: () async {},
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: EdgeInsets.all(13),
          child: Column(children: [
            TextFieldWidget(
                label: 'Full Name', text: user.name, onChanged: (name) {}),
            SizedBox(
              height: 24,
            ),
            TextFieldWidget(
                label: 'Email', text: user.email, onChanged: (email) {}),
            SizedBox(
              height: 24,
            ),
            TextFieldWidget(
                label: 'Room Number', text: user.roomno, onChanged: (roomno) {})
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.2 * screen().width),
          child: ElevatedButton.icon(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  backgroundColor: MaterialStateProperty.all(primaryPurple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ))),
              onPressed: () {},
              icon: Icon(
                Icons.save,
                size: 20,
              ),
              label: Text(
                'SAVE',
                style: TextStyle(
                  color: whiteColor,
                  fontFamily: "Oxygen",
                  fontSize: 18,
                ),
              )),
        ),
      ]),
    );
  }
}
