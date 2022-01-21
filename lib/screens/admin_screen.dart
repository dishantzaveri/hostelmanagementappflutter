// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:easydorm/constants.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Size screen() {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "easyDorms",
          style: TextStyle(
            fontFamily: "Oxygen",
            fontSize: 20,
          ),
        ),
        backgroundColor: secPurple,
      ),
      body: Stack(children: [
        Container(
          height: screen().height,
          width: screen().width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [primaryPurple, Color(0xFF4527A0)])),
        ),
        Container(
          height: screen().height,
          width: screen().width,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        primary: primaryPurple,
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: whiteColor))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Student Data",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  color: whiteColor,
                                  fontSize: 20)),
                        ),
                        SizedBox(width: 0.5 * screen().width),
                        Icon(Icons.person)
                      ],
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        primary: primaryPurple,
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: whiteColor))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Warden Data",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  color: whiteColor,
                                  fontSize: 20)),
                        ),
                        SizedBox(width: 0.5 * screen().width),
                        Icon(Icons.manage_accounts_outlined)
                      ],
                    )),
              )
            ],
          ),
        )
      ]),
    );
  }
}
