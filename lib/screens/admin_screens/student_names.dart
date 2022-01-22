// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydorm/constants.dart';
import 'package:easydorm/screens/admin_screens/student_data.dart';
import 'package:easydorm/screens/warden_screens/warden_student_edit.dart';
import 'package:flutter/material.dart';

import '../nav_bar.dart';

class StudentName extends StatefulWidget {
  const StudentName({Key? key}) : super(key: key);

  @override
  State<StudentName> createState() => _StudentNameState();
}

class _StudentNameState extends State<StudentName> {
  Size screen() {
    return MediaQuery.of(context).size;
  }
final Stream<QuerySnapshot> students =
      FirebaseFirestore.instance.collection('Students').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navigation(),
        backgroundColor: whiteColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Students",
            style: TextStyle(
              fontFamily: "Oxygen",
              fontSize: 20,
            ),
          ),
          backgroundColor: primaryPurple,
        ),
        body: Stack(children: [
          Container(
            height: screen().height,
            width: screen().width,
            decoration: BoxDecoration(color: whiteColor),
          ),
          Container(
            height: screen().height,
            width: screen().width,
            child: StreamBuilder<QuerySnapshot>(
              stream: students,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went Wrong.");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading.");
                }
                final data = snapshot.requireData;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final studentIndex = index;
                    return ListTile(
                      leading: TextButton(
                        style: TextButton.styleFrom(primary: whiteColor),
                        child: Text("${data.docs[index]['Name']}",
                            style: TextStyle(
                                color: greyColor,
                                fontFamily: "Oxygen",
                                fontSize: 15)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentData(
                                        studentIndex: studentIndex,
                                      )));
                        },
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: primaryPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: primaryPurple))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WeditPage(studentId: studentIndex)),
                          );
                        },
                        child: Icon(Icons.edit),
                      ),
                    );
                  },
                  itemCount: data.size,
                );
              },
            ),
           
          )
        ]));
  }
}
