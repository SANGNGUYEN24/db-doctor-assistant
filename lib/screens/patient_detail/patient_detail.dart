import 'package:app/services/firebase_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class PatientDetail extends StatefulWidget {
  final String patientId;

  const PatientDetail({this.patientId});

  @override
  _PatientDetailState createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  Firestore firestore = new Firestore();
  var doc;
  @override
  void initState() {
    super.initState();
    firestore.patientReference.doc(widget.patientId).get().then((docSnap) {
      setState(() {
        doc = docSnap.data();
        print(doc);
      });
    });
    //
    // patient.patientId = doc["patientId"].toString();
    // patient.adDistrict = doc["adDistrict"];
    // patient.adProvinceCity = doc["adProvinceCity"];
    // patient.adStreet = doc["adStreet"];
    // patient.adWard = doc["adWard"];
    // patient.birthDate = doc["birthdate"];
    // patient.dateIn = doc["dateIn"];
    // patient.dateOut = doc["dateOut"];
    // patient.firstName = doc["firstName"];
    // patient.lastName = doc["lastName"];
    // patient.fType = doc["fType"];
    // patient.gender = doc["gender"];
    // patient.healthNumber = doc["healthNumber"];
    // patient.idCardNumber = doc["idCardNumber"];
    // patient.phoneNumber = doc["phoneNumber"];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Patient information",
            style:
                TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
      ),
      body: doc == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doc["lastName"] + " " + doc["firstName"],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(doc["birthDate"]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      OutlinedButton(
                          onPressed: () {}, child: Text("View records")),
                      SizedBox(
                        width: 24,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                        "Add this patient to your patients?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {}, child: Text("NO")),
                                      TextButton(
                                          onPressed: () {}, child: Text("YES")),
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.add_rounded),
                          label: Text("Add to your patients")),
                    ],
                  ),
                  buildColumn(text: "F type", query: "fType"),
                  buildColumn(text: "Gender", query: "gender"),
                  buildDivider(),
                  buildColumn(text: "Patient ID", query: "patientId"),
                  buildDivider(),
                  buildColumn(text: "Province/City", query: "adProvinceCity"),
                  buildColumn(text: "District", query: "adDistrict"),
                  buildColumn(text: "Street", query: "adStreet"),
                  buildColumn(text: "Ward", query: "adWard"),
                  buildDivider(),
                  buildColumn(text: "Birth date", query: "birthDate"),
                  buildDivider(),
                  buildColumn(text: "Date in", query: "dateIn"),
                  buildColumn(text: "Date out", query: "dateOut"),
                  buildDivider(),
                  buildColumn(text: "Health no", query: "healthNumber"),
                  buildColumn(text: "ID", query: "idCardNumber"),
                  buildColumn(text: "Phone", query: "phoneNumber"),
                ],
              ),
            ),
    );
  }

  Divider buildDivider() {
    return Divider(
      thickness: 2,
      indent: 48,
      endIndent: 48,
    );
  }

  Column buildColumn({String text, String query}) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            hintText: text + ": " + doc[query].toString(),
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
