// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:easydorm/constants.dart';
import 'package:easydorm/student_files/payment_four.dart';
import 'package:easydorm/student_files/payment_three.dart';
import 'package:easydorm/student_files/payment_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
      Size screen() {
    return MediaQuery.of(context).size;
  }

  Widget buildpay(Mypay user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
            width: screen().width,
            child: Row(
              children: [
                Text('Status: ',
                    style: TextStyle(
                        color: whiteColor,
                        fontFamily: "Oxygen",
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                (user.pending == true)
                    ? Text(
                        'Payment Pending',
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: "Oxygen",
                          fontSize: 20,
                        ),
                      )
                    : Text(
                        'Payment Done',
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: "Oxygen",
                          fontSize: 20,
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: screen().width,
            child: Row(
              children: [
                Text(
                  'Amount: ',
                  style: TextStyle(
                      color: whiteColor,
                      fontFamily: "Oxygen",
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                (user.pending == true)
                    ? Text(
                        '${user.fee}',
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: "Oxygen",
                          fontSize: 20,
                        ),
                      )
                    : Text(
                        'None',
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: "Oxygen",
                          fontSize: 20,
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(height: 20),
          (user.pending == true)
              ? Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.only(left: 14, right: 14)),
                            backgroundColor:
                                MaterialStateProperty.all(whiteColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        onPressed:  (){Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  Razor()),
                );},
                        child: Text('Pay Now',
                            style: TextStyle(
                              color: primaryPurple,
                              fontFamily: "Oxygen",
                              fontSize: 18,
                            ))),
                  ],
                )
              : Text('None'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final user = Paypref.myPay;
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: primaryPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: screen().height,
        width: screen().width,
        margin: EdgeInsets.only(
            top: screen().height * 0.05, left: screen().height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //margin: EdgeInsets.only(top: screen().height*0.175,left: 30),
              child: Text(
                'Payment',
                style: TextStyle(
                  color: whiteColor,
                  fontFamily: "Oxygen",
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            buildpay(user),
          ],
        ),
      ),
    );
  }
}
