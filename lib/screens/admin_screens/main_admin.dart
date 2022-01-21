// // ignore_for_file: prefer_const_constructors
// import 'package:easydorm/constants.dart';
// import 'package:easydorm/screens/admin_screens/student_data.dart';
// import 'package:flutter/material.dart';

// class Admin extends StatefulWidget {
//   const Admin({Key? key}) : super(key: key);

//   @override
//   _AdminState createState() => _AdminState();
// }

// class _AdminState extends State<Admin> {
//   Size screen() {
//     return MediaQuery.of(context).size;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "easyDorms-Admin",
//           style: TextStyle(
//             fontFamily: "Oxygen",
//             fontSize: 20,
//           ),
//         ),
//         backgroundColor: transparent,
//       ),
//       body: Stack(children: [
//         Container(
//           height: screen().height,
//           width: screen().width,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [primaryPurple, Color(0xFF4527A0)])),
//         ),
//         Container(
//           height: screen().height,
//           width: screen().width,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 0.35 * screen().height,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 child: ElevatedButton(
//                     onPressed: () {Navigator.push(
//               context, MaterialPageRoute(builder: (context) => StudentData()));},
//                     style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.all(15),
//                         primary: whiteColor,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             side: BorderSide(color: primaryPurple))),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text("Student Data",
//                               style: TextStyle(
//                                   fontFamily: "OpenSans",
//                                   color: greyColor,
//                                   fontSize: 20)),
//                         ),
//                         SizedBox(width: 0.45 * screen().width),
//                         Icon(Icons.person)
//                       ],
//                     )),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.all(15),
//                         primary: whiteColor,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             side: BorderSide(color: primaryPurple))),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text("Warden Data",
//                               style: TextStyle(
//                                   fontFamily: "OpenSans",
//                                   color: greyColor,
//                                   fontSize: 20)),
//                         ),
//                         SizedBox(width: 0.45 * screen().width),
//                         Icon(Icons.manage_accounts_outlined)
//                       ],
//                     )),
//               )
//             ],
//           ),
//         )
//       ]),
//     );
//   }
// }
