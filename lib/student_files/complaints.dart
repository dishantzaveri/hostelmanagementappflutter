import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/constants.dart';

class Complaint extends StatefulWidget {
  const Complaint({Key? key}) : super(key: key);

  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  Size screen() {
    return MediaQuery.of(context).size;
  }

  final formKey = GlobalKey<FormState>();
  String username = '';
  TextEditingController name_controller = TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController desc_controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildName() => Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: whiteColor,
                  fontFamily: "Oxygen",
                  fontSize: 17,
                ),
              ),
              onChanged: (value) => setState(() => username = value),
              controller: name_controller,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Complaint',
                labelStyle: TextStyle(
                  color: whiteColor,
                  fontFamily: "Oxygen",
                  fontSize: 17,
                ),
              ),
              onChanged: (value) => setState(() => username = value),
              controller: controller,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(
                  color: whiteColor,
                  fontFamily: "Oxygen",
                  fontSize: 17,
                ),
              ),
              onChanged: (value) => setState(() => username = value),
              controller: desc_controller,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    CollectionReference complaints =
        FirebaseFirestore.instance.collection('Complaints');
    return Scaffold(
      backgroundColor: primaryPurple,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Complaints",
          style: TextStyle(
            fontFamily: "Oxygen",
            fontSize: 24,
          ),
        ),
        backgroundColor: primaryPurple,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [primaryPurple, Color(0xFF4527A0)])),
          ),
          ListView(
            children: [
              buildName(),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  complaints
                      .add({
                        'Name': name_controller.text,
                        'title': controller.text,
                        'desc': desc_controller.text
                      })
                      .then((value) => print("Complaint added"))
                      .catchError((error) => print("Something went wrong"));
                },
                child: Text("Submit",
                    style: TextStyle(
                        fontFamily: "Oxygen", fontSize: 18, color: greyColor)),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: whiteColor),
              )
              //button//
            ],
          )
        ],
      ),
    );
  }
}
