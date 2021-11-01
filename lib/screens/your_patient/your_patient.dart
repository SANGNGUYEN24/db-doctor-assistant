import 'package:app/components/patient_card.dart';
import 'package:app/constants.dart';
import 'package:app/services/firebase_firestore.dart';
import 'package:flutter/material.dart';

class YourPatient extends StatefulWidget {
  final String doctorId;

  const YourPatient({Key key, this.doctorId}) : super(key: key);

  @override
  _YourPatientState createState() => _YourPatientState();
}

class _YourPatientState extends State<YourPatient> {
  Firestore firestore = new Firestore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Your patients",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor)),
        ),
        body: ListView(
          children: [
            PatientCard(
              patientId: "patient1",
              patientName: "Nguyen Minh Hao",
              birthdate: "23/09/2000",
              fType: 0,
            ),
            PatientCard(
              patientId: "patient2",
              patientName: "Tong Thi Oanh",
              birthdate: "23/08/1977",
              fType: 1,
            ),
            PatientCard(
              patientId: "patient1",
              patientName: "Ngo Ngoc Dai",
              birthdate: "10/10/2000",
              fType: 0,
            ),
          ],
        ));
  }
}
