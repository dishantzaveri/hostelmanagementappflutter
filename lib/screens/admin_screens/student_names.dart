// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydorm/constants.dart';
import 'package:easydorm/screens/admin_screens/student_data.dart';
import 'package:easydorm/screens/nav_admin.dart';
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

  String dropDownValue = "A101";
  List<String> states = [
    "A101",
    "A102",
    "A103",
    "A104",
    "A201",
    "A202",
    "A203",
    "A204",
    "A301",
    "A302"
  ];
  final Stream<QuerySnapshot> students =
      FirebaseFirestore.instance.collection('Students').snapshots();
  @override
  Widget build(BuildContext context) {
    CollectionReference students1 =
        FirebaseFirestore.instance.collection('Students');
    return Scaffold(
        drawer: NavAdmin(),
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
                    final id = data.docs[index].id;
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
                      title: Container(
                        width: screen().width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Select region",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontFamily: "Oxygen",
                                  fontSize: 15,
                                )),
                            SizedBox(height: 10),
                            Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: primaryPurple,
                              ),
                              child: Container(
                                width: 0.65 * screen().width,
                                child: DropdownButton(
                                  value: dropDownValue,
                                  items: states.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: TextStyle(
                                            color: greyColor,
                                            fontFamily: "Oxygen",
                                            fontSize: 17,
                                          )),
                                    );
                                  }).toList(),
                                  icon: Icon(
                                    // Add this
                                    Icons.arrow_drop_down, // Add this
                                    color: greyColor, // Add this
                                  ),
                                  onChanged: (dynamic value) {
                                    dropDownValue = value;
                                    students1
                                        .doc('$id')
                                        .update({'Room no': dropDownValue});
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
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
            // child: ListView.builder(
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       leading: TextButton(
            //         style: TextButton.styleFrom(primary: whiteColor),
            //         child: Text("Prathmesh Ghatol",
            //             style: TextStyle(
            //                 color: greyColor,
            //                 fontFamily: "Oxygen",
            //                 fontSize: 15)),
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => StudentData()),
            //           );
            //         },
            //       ),
            //       trailing: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //             primary: primaryPurple,
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(30),
            //                 side: BorderSide(color: primaryPurple))),
            //         onPressed: () {},
            //         child: Icon(Icons.arrow_forward_ios_rounded),
            //       ),
            //     );
            //   },
            //   itemCount: 20,
            // ),
          )
        ]));
  }
}
