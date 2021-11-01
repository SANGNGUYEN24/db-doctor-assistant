import 'package:app/screens/your_patient/your_patient.dart';
import 'package:app/services/firebase_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  Firestore firestore = new Firestore();
  String doctorId;
  getDoctorId() {
    print(firestore.userId);
    return firestore.userId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome doctor",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.assignment_rounded),
        label: Text("Your patients",
            style: TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => YourPatient(
                        doctorId: getDoctorId(),
                      )));
        },
      ),
    );
  }
}
