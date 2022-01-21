// ignore_for_file: prefer_const_constructors

import 'package:easydorm/screens/admin_screens/main_admin.dart';
import 'package:easydorm/screens/admin_screens/student_names.dart';
import 'package:easydorm/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Size screen() {
    return MediaQuery.of(context).size;
  }

  String dropDownValue = "Student";
  Widget _buildUser() {
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
                  prefixIcon:
                      Icon(Icons.email_outlined, color: Colors.white),
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

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => StudentData()));
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
              return EdgeInsets.all(15);
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: primaryPurple))),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Text(
          'LOGIN',
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

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUp()));},
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Oxygen",
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        backgroundColor: transparent,
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
                      "Sign in",
                      style: TextStyle(
                        fontFamily: "Oxygen",
                        color: whiteColor,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 20),
                    Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: primaryPurple,
                      ),
                      child: DropdownButton(
                        value: dropDownValue,
                        items: ['Admin', 'Warden', 'Student']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontFamily: "Oxygen",
                                  fontSize: 17,
                                )),
                          );
                        }).toList(),
                        icon: Icon(
                          // Add this
                          Icons.arrow_drop_down, // Add this
                          color: Colors.white, // Add this
                        ),
                        onChanged: (dynamic value) {
                          dropDownValue = value;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildUser(),
                    SizedBox(height: 30),
                    _buildPass(),
                    _buildLoginBtn(),
                    _buildSignupBtn()
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
