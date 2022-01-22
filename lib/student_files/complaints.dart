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
   late final TextEditingController controller;
  @override
  void initState(){
    super.initState();
    controller = TextEditingController(text: username);
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
    
  }
  Widget buildName() => Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration (
      
    ),
    child: TextField(
      
          decoration: InputDecoration(
            border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
              labelText: 'Complaint',
              labelStyle: TextStyle(
                color: whiteColor,
                fontFamily: "Oxygen",
                fontSize: 22,
              ),
            ),
          onChanged: (value) => setState(() => username = value),
       
       controller: controller, ),
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryPurple,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x00ffffff),
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
              //button//
            ],
          )
        ],
      ),
    );
  }
}
