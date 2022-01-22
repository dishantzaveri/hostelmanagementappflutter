// ignore_for_file: prefer_const_constructors

import 'package:easydorm/student_files/check_in.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/constants.dart';

class TakeLeave extends StatefulWidget {
  const TakeLeave({Key? key}) : super(key: key);

  @override
  _TakeLeaveState createState() => _TakeLeaveState();
}

class _TakeLeaveState extends State<TakeLeave> {
  Size screen() {
    return MediaQuery.of(context).size;
  }

  DateTime? _startleave;
  DateTime? _endleave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x00ffffff),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [primaryPurple, Color(0xFF4527A0)])),
          ),
          Container(
              margin: EdgeInsets.only(top: 0.1 * screen().height),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _startleave == null
                                ? 'Start Date'
                                : '${_startleave?.day}/${_startleave?.month}/${_startleave?.year}',
                            style: TextStyle(
                                fontFamily: "Oxygen",
                                fontSize: 20,
                                color: whiteColor),
                          ),
                          // ignore: prefer_const_constructors
                          IconButton(
                            splashRadius: 20,
                            icon: Icon(
                              Icons.calendar_today,
                              color: whiteColor,
                              size: 20,
                            ),
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2001),
                                      lastDate: DateTime(2050))
                                  .then((date) {
                                setState(() {
                                  _startleave = date!;
                                });
                              });
                            },
                          ),

//
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.3 * screen().width),
                    child: ElevatedButton.icon(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.only(top: 8, bottom: 8, right: 5)),
                            backgroundColor:
                                MaterialStateProperty.all(whiteColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        onPressed: () {},
                        icon: Icon(
                          Icons.payment,
                          size: 0,
                        ),
                        label: Text(
                          'Start Of Leave',
                          style: TextStyle(
                            color: primaryPurple,
                            fontFamily: "Oxygen",
                            fontSize: 15,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 0.05 * screen().height,
                  ),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _endleave == null
                                ? 'End Date'
                                : '${_endleave?.day}/${_endleave?.month}/${_endleave?.year}',
                            style: TextStyle(
                                fontFamily: "Oxygen",
                                fontSize: 20,
                                color: whiteColor),
                          ),
                          // ignore: prefer_const_constructors
                          IconButton(
                            splashRadius: 20,
                            icon: Icon(
                              Icons.calendar_today,
                              color: whiteColor,
                              size: 20,
                            ),
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2001),
                                      lastDate: DateTime(2050))
                                  .then((date) {
                                setState(() {
                                  _endleave = date!;
                                });
                              });
                            },
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.299 * screen().width),
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.only(
                                        top: 8, bottom: 8, right: 5)),
                                backgroundColor:
                                    MaterialStateProperty.all(whiteColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ))),
                            onPressed: () {},
                            icon: Icon(
                              Icons.payment,
                              size: 0,
                            ),
                            label: Text(
                              'End Of Leave',
                              style: TextStyle(
                                color: primaryPurple,
                                fontFamily: "Oxygen",
                                fontSize: 15,
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.299 * screen().width),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Reason of Leave',
                            labelStyle: (TextStyle(
                                fontFamily: "Oxygen",
                                fontSize: 20,
                                color: whiteColor)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.299 * screen().width),
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.only(
                                        top: 8, bottom: 8, right: 5)),
                                backgroundColor:
                                    MaterialStateProperty.all(whiteColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckIn()),
                              );
                            },
                            icon: Icon(
                              Icons.payment,
                              size: 0,
                            ),
                            label: Text(
                              'Submit',
                              style: TextStyle(
                                color: primaryPurple,
                                fontFamily: "Oxygen",
                                fontSize: 15,
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.12 * screen().height,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
