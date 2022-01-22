import 'package:easydorm/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(Razor());

class Razor extends StatefulWidget {
  @override
  _RazorState createState() => _RazorState();
}

class _RazorState extends State<Razor> {
  static const platform = const MethodChannel("razorpay_flutter");


  TextEditingController txtcontroller = new TextEditingController();
  late Razorpay _razorpay;
    Size screen() {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         extendBodyBehindAppBar: false,
      backgroundColor: primaryPurple,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 0.2*screen().height ),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                 Container(
                          width: 100,
                          height: 40,
                          child: TextField(
                            controller: txtcontroller,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                labelText: 'Pay',
                                labelStyle: TextStyle(
                                    color: whiteColor,
                                    fontFamily: "Oxygen",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          )),
                          SizedBox(width: 10,),
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
                          onPressed: openCheckout,
                          child: Text('Pay Now',
                              style: TextStyle(
                                color: primaryPurple,
                                fontFamily: "Oxygen",
                                fontSize: 18,
                              ))),
                          
              ])),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_BTwylQP28a8Fwm',
      'amount': num.parse(txtcontroller.text)*100,
      'name': 'easydorms',
      'description': 'Hostel Yearly Fees Payment/Mess Fees',
      'retry': {'enabled': true, 'max_count': 1},
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!, toastLength: Toast.LENGTH_SHORT);
  }
}