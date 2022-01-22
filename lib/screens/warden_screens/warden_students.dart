// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:easydorm/constants.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/screens/warden_screens/warden_student_edit';

import '../nav_bar.dart';

class WardenStudent extends StatefulWidget {
  const WardenStudent({Key? key}) : super(key: key);

  @override
  State<WardenStudent> createState() => _WardenStudentState();
}

class _WardenStudentState extends State<WardenStudent> {
  Size screen() {
    return MediaQuery.of(context).size;
  }

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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: TextButton(
                      style: TextButton.styleFrom(primary: whiteColor),
                      child: Text("Prathmesh Ghatol",
                          style: TextStyle(
                              color: greyColor,
                              fontFamily: "Oxygen",
                              fontSize: 15)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeditPage()));
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
                          MaterialPageRoute(builder: (context) => WeditPage()),
                        );
                      },
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  );
                },
                itemCount: 20,
              ))
        ]));
  }
}
