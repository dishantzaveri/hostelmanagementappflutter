// ignore_for_file: prefer_const_constructors

import 'package:easydorm/constants.dart';
import 'package:flutter/material.dart';

class StudentData extends StatefulWidget {
  const StudentData({Key? key}) : super(key: key);

  @override
  State<StudentData> createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  Size screen() {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    title: TextButton(
                      style: TextButton.styleFrom(primary: whiteColor),
                      child: Text(
                        "Prathmesh Ghatol",
                        style: TextStyle(color: greyColor),
                      ),
                      onPressed: () {},
                    ),
                  );
                },
                itemCount: 20,
              ))
        ]));
  }
}
