// ignore_for_file: prefer_const_constructors

import 'package:easydorm/constants.dart';
import 'package:easydorm/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Size screen() {
    return MediaQuery.of(context).size;
  }

  Widget _buildUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Username",
            style: TextStyle(
              color: whiteColor,
              fontFamily: "Oxygen",
              fontSize: 17,
            )),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon:
                      Icon(Icons.supervised_user_circle, color: Colors.white),
                  hintText: "Enter your UserName",
                  hintStyle: TextStyle(
                      fontFamily: "Oxygen", fontSize: 15, color: whiteColor))),
        )
      ],
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email",
            style: TextStyle(
              color: whiteColor,
              fontFamily: "Oxygen",
              fontSize: 17,
            )),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(
                      fontFamily: "Oxygen", fontSize: 15, color: whiteColor))),
        )
      ],
    );
  }

  Widget _buildPass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("PassWord",
            style: TextStyle(
              color: whiteColor,
              fontFamily: "Oxygen",
              fontSize: 17,
            )),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          child: TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(
                      fontFamily: "Oxygen", fontSize: 15, color: whiteColor))),
        )
      ],
    );
  }
Widget _buildSignupBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ));
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
              return EdgeInsets.all(15);
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.red))),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
// Widget _buildStatesDrpDown(){
// List<String> states= ["Andra Pradesh","Arunachal Pradesh","Assam","Bihar"];
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "easyDorms",
          style: TextStyle(
            fontFamily: "Oxygen",
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
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
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: "Oxygen",
                        color: whiteColor,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 15),
                    _buildUser(),
                    SizedBox(height: 15),
                    _buildEmail(),
                    SizedBox(height: 15),
                    _buildPass(),
                    _buildSignupBtn()
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
