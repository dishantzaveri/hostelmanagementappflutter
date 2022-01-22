// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydorm/screens/admin_screens/student_preview.dart';
import 'package:easydorm/screens/nav_bar.dart';
import 'package:easydorm/screens/warden_screens/warden_student_edit.dart';
import 'package:easydorm/student_files/check_in.dart';
import 'package:easydorm/student_files/edit_student_data.dart';
import 'package:easydorm/student_files/profile.dart';
import 'package:easydorm/student_files/user_student.dart';
import 'package:easydorm/student_files/user_data.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/constants.dart';

class StudentData extends StatefulWidget {
  final studentIndex;
  StudentData({Key? key, required this.studentIndex}) : super(key: key);

  @override
  _StudentDataState createState() => _StudentDataState();
}

final Stream<QuerySnapshot> students =
    FirebaseFirestore.instance.collection('Students').snapshots();

class _StudentDataState extends State<StudentData> {
  Widget buildName(MyUser user) => StreamBuilder<QuerySnapshot>(
        stream: students,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went Wrong.");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading.");
          }
          final data = snapshot.requireData;
          return Column(
            children: [
              Text(
                "${data.docs[widget.studentIndex]['Name']}",
                style: TextStyle(
                  color: primaryPurple,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Oxygen",
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Room Number:',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: greyColor,
                      fontFamily: "Oxygen",
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${data.docs[widget.studentIndex]['Room no']}",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: greyColor,
                      fontFamily: "Oxygen",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${data.docs[widget.studentIndex]['Email']}",
                style: TextStyle(
                  color: greyColor,
                  fontFamily: "Oxygen",
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          );
        },
      );
  @override
  Widget build(BuildContext context) {
    final user = Userpref.myUser;
    return Scaffold(
      drawer: Navigation(),
      backgroundColor: whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: primaryPurple,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Profile(
              image: user.imagePath,
              onClicked: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WeditPage(studentId: widget.studentIndex)),
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
        ],
      ),
    );
  }
}
