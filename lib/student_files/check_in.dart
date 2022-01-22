// ignore_for_file: prefer_const_constructors

import 'package:easydorm/student_files/take_leave.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/constants.dart';
import 'package:flutter/cupertino.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  Size screen() {
    return MediaQuery.of(context).size;
  }

  DateTime? _dateTime;
  DateTime? _outTime;

  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay outTime = TimeOfDay.now();
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
                            _dateTime == null
                                ? 'Entry Date'
                                : '${_dateTime?.day}/${_dateTime?.month}/${_dateTime?.year}',
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
                                  _dateTime = date!;
                                });
                              });
                            },
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8)),
                                backgroundColor:
                                    MaterialStateProperty.all(greyColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ))),
                            onPressed: () {
                              selectTime(context);
                            },
                            child: Text(
                              _dateTime == null
                                  ? 'Entry Time'
                                  : '${selectedTime.hour}:${selectedTime.minute}',
                              style: TextStyle(
                                  fontFamily: "Oxygen",
                                  fontSize: 15,
                                  color: whiteColor),
                            ),
                          ),
//
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.2 * screen().width),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(whiteColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        onPressed: () {},
                        child: Text(
                          'Check-In',
                          style: TextStyle(
                            color: primaryPurple,
                            fontFamily: "Oxygen",
                            fontSize: 18,
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
                            _dateTime == null
                                ? 'Exit Date'
                                : '${_outTime?.day}/${_outTime?.month}/${_outTime?.year}',
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
                                  _outTime = date!;
                                });
                              });
                            },
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8)),
                                backgroundColor:
                                    MaterialStateProperty.all(greyColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ))),
                            onPressed: () {
                              _selectTime(context);
                            },
                            child: Text(
                              _outTime == null
                                  ? 'Exit Time'
                                  : '${outTime.hour}:${outTime.minute}',
                              style: TextStyle(
                                  fontFamily: "Oxygen",
                                  fontSize: 15,
                                  color: whiteColor),
                            ),
                          ),
//
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.2 * screen().width),
                    child: ElevatedButton.icon(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.only(top: 8, bottom: 8, right: 4)),
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
                          'Check-Out',
                          style: TextStyle(
                            color: primaryPurple,
                            fontFamily: "Oxygen",
                            fontSize: 17,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 0.12 * screen().height,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.only(top: 15, bottom: 15)),
                            backgroundColor:
                                MaterialStateProperty.all(whiteColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TakeLeave()),
                          );
                        },
                        child: Text(
                          'Take Leave',
                          style: TextStyle(
                            color: primaryPurple,
                            fontFamily: "Oxygen",
                            fontSize: 18,
                          ),
                        )),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: outTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != outTime) {
      setState(() {
        outTime = timeOfDay;
      });
    }
  }
}
