import 'package:easydorm/constants.dart';
import 'package:easydorm/screens/complaints_view.dart';
import 'package:easydorm/screens/login_signup%20files/signin_screen.dart';
import 'package:easydorm/student_files/complaints.dart';
import 'package:easydorm/student_files/complaints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reach_us.dart';
import 'home_page.dart';

class NavAdmin extends StatefulWidget {
  const NavAdmin({Key? key}) : super(key: key);

  @override
  State<NavAdmin> createState() => _NavAdminState();
}

class _NavAdminState extends State<NavAdmin> {
  Widget buildMenuItem(
      {required String text, VoidCallback? onClicked, required IconData icon}) {
    final color = primaryPurple;
    return ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: color,
            fontFamily: "Oxygen",
            fontSize: 18,
          ),
        ),
        onTap: onClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: whiteColor,
        child: ListView(
          children: [
            buildMenuItem(
              text: 'Complaints',
              icon: Icons.edit,
              onClicked: () => selectedItem(context, 1),
            ),
            buildMenuItem(
              text: 'Feedback',
              icon: Icons.edit,
              onClicked: () => Navigator.push(context,
                  MaterialPageRoute<void>(builder: (context) => ReachUs())),
            ),
            buildMenuItem(
              text: 'Sign Out', icon: Icons.exit_to_app,
              onClicked: () => selectedItem(context, 0),
              //  onPressed: () {
              //   FirebaseAuth.instance.signOut().then((value) {
              //     print("Signed Out");
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (context) => HomePage()));
              //   });
              // },
            )
          ],
        ),
      ),
    );
  }
}

selectedItem(BuildContext context, int i) {
  switch (i) {
    case 0:
      FirebaseAuth.instance.signOut().then((value) {
        print("Signed Out");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ViewComplaints()),
      );
      break;
  }
}
