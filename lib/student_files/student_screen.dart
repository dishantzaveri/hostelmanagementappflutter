// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:easydorm/screens/nav_bar.dart';
import 'package:easydorm/student_files/check_in.dart';
import 'package:easydorm/student_files/edit_student_data.dart';
import 'package:easydorm/student_files/food_one.dart';
import 'package:easydorm/student_files/payment_hostel.dart';
import 'package:easydorm/student_files/profile.dart';
import 'package:easydorm/student_files/user_student.dart';
import 'package:easydorm/student_files/user_data.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/constants.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  Widget buildName(MyUser user) => Column(
      children: [
        Text(
          user.name,
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
              user.roomno,
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
          user.email,
          style: TextStyle(
            color: greyColor,
            fontFamily: "Oxygen",
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton.icon(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all(primaryPurple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  Payment()),
                );
            },
            icon: Icon(
              Icons.payment,
              size: 20,
            ),
            label: Text(
              'Hostel Payment',
              style: TextStyle(
                color: whiteColor,
                fontFamily: "Oxygen",
                fontSize: 18,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 31, vertical: 15)),
                backgroundColor: MaterialStateProperty.all(primaryPurple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  Food()),
                );
            },
            icon: Icon(
              Icons.food_bank,
              size: 20,
            ),
            label: Text(
              'Food Billing',
              style: TextStyle(
                color: whiteColor,
                fontFamily: "Oxygen",
                fontSize: 18,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 36, vertical: 15)),
                backgroundColor: MaterialStateProperty.all(primaryPurple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ))),
           onPressed: () { Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CheckIn()),
                );},
            icon: Icon(
              Icons.calendar_view_day_sharp,
              size: 20,
            ),
            label: Text(
              'Attendance',
              style: TextStyle(
                color: whiteColor,
                fontFamily: "Oxygen",
                fontSize: 18,
              ),
            )),
      ],
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
                  MaterialPageRoute(builder: (context) => EditPage()),
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

