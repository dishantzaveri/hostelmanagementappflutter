import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydorm/constants.dart';
import 'package:flutter/material.dart';

class ViewComplaints extends StatefulWidget {
  const ViewComplaints({Key? key}) : super(key: key);

  @override
  _ViewComplaintsState createState() => _ViewComplaintsState();
}

class _ViewComplaintsState extends State<ViewComplaints> {
  Size screen() {
    return MediaQuery.of(context).size;
  }

  final Stream<QuerySnapshot> complaints =
      FirebaseFirestore.instance.collection('Complaints').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Complaints",
          style: TextStyle(
            fontFamily: "Oxygen",
            fontSize: 20,
          ),
        ),
        backgroundColor: primaryPurple,
      ),
      body: Stack(children: [
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
            child: StreamBuilder<QuerySnapshot>(
              stream: complaints,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went Wrong.");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading.");
                }
                final data = snapshot.requireData;

                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final complaintIndex = index;
                    final id = data.docs[index].id;
                    return ListTile(
                        title: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                          child: Card(
                            
                            elevation: 8,
                            child: Container(
                                             padding: EdgeInsets.all(15),   
                                                width: screen().width,
                                                child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name: ${data.docs[index]['Name']}",
                                  style: TextStyle(
                                      color: greyColor,
                                      fontFamily: "Oxygen",
                                      fontSize: 15)),
                              SizedBox(height: 20),
                              Text("Title: ${data.docs[index]['title']}",
                                  style: TextStyle(
                                      color: greyColor,
                                      fontFamily: "Oxygen",
                                      fontSize: 15)),
                              SizedBox(height: 20),
                              Text("Description: ${data.docs[index]['desc']}",
                                  style: TextStyle(
                                      color: greyColor,
                                      fontFamily: "Oxygen",
                                      fontSize: 15)),
                            ],
                                                ),
                                              ),
                          ),
                        ));
                  },
                  itemCount: data.size,
                );
              },
            ))
      ]),
    );
  }
}
