import 'package:easydorm/student_files/student_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easydorm/reusable_widgets/reusable_widget.dart';

import 'package:easydorm/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  Size screen() {
    return MediaQuery.of(context).size;
  }

  String dropDownValue = "Maharashtra";
  Widget _buildStatesDrpDown() {
    List<String> states = [
      "Andaman and Nicobar Islands",
      "Andra Pradesh",
      "Arunachal Pradesh",
      "Assam",
      "Bihar",
      "Chandigarh",
      "Chhattisgarh",
      "Dadra and Nagar Haveli",
      "Daman and Diu",
      "Delhi",
      "Goa",
      "Gujarat",
      "Haryana",
      "Himachal Pradesh",
      "Jammu and Kashmir",
      "Jharkhand",
      "Karnataka",
      "Kerala",
      "Lakshadweep",
      "Madhya Pradesh",
      "Maharashtra",
      "Manipur",
      "Meghalaya",
      "Mizoram",
      "Nagaland",
      "Odisha",
      "Pondicherry",
      "Punjab",
      "Rajasthan",
      "Sikkim",
      "Tamil Nadu",
      "Telangana",
      "Tripura",
      "Uttar Pradesh",
      "Uttarakhand",
      "West Bengal"
    ];
    return Container(
      width: screen().width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select region",
              style: TextStyle(
                color: whiteColor,
                fontFamily: "Oxygen",
                fontSize: 15,
              )),
          SizedBox(height: 10),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: primaryPurple,
            ),
            child: Container(
              width: 0.65 * screen().width,
              child: DropdownButton(
                value: dropDownValue,
                items: states.map<DropdownMenuItem<String>>((String value) {
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
          ),
        ],
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
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [primaryPurple, Color(0xFF4527A0)])),
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: "Oxygen",
                        color: whiteColor,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Email Id", Icons.person_outline,
                        false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined,
                        true, _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter PinCode", Icons.person_outline,
                        false, _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Sign Up", () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Student()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    })
                  ],
                ),
              ))),
    );
  }
}
