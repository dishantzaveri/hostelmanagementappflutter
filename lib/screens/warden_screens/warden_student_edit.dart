// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
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

  final Stream<QuerySnapshot> students1 =
      FirebaseFirestore.instance.collection('Students').snapshots();
  var newName = '';
  var newEmail = '';
  var newRoom = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    roomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference students =
        FirebaseFirestore.instance.collection('Students');
    return Scaffold(
      backgroundColor: whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
            child: StreamBuilder<QuerySnapshot>(
              stream: students1,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went Wrong.");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading.");
                }
                final data = snapshot.requireData;
                final id = data.docs[widget.studentId].id;
                return Column(children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: data.docs[widget.studentId]['Name']),
                  ),
                  // TextFieldWidget(
                  //     label: 'Full Name',
                  //     text: data.docs[widget.studentId]['Name'],
                  //     onChanged: (name) {
                  //       newName = name;
                  //     }),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: data.docs[widget.studentId]['Email']),
                  ),
                  // TextFieldWidget(
                  //     label: 'Email',
                  //     text: data.docs[widget.studentId]['Email'],
                  //     onChanged: (email) {
                  //       newEmail = email;
                  //     }),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: roomController,
                    decoration: InputDecoration(
                        hintText: data.docs[widget.studentId]['Room no']),
                  ),
                  // TextFieldWidget(
                  //     label: 'Room Number',
                  //     text: data.docs[widget.studentId]['Room no'],
                  //     onChanged: (roomno) {
                  //       newRoom = roomno;
                  //     }),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.2 * screen().width),
                    child: ElevatedButton.icon(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15)),
                            backgroundColor:
                                MaterialStateProperty.all(primaryPurple),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        onPressed: () {
                          students.doc('$id').update({
                            'Name': nameController.text,
                            'Email': emailController.text,
                            'Room no': roomController.text
                          });
                        },
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
                ]);
              },
            )),
      ]),
    );
  }
}
