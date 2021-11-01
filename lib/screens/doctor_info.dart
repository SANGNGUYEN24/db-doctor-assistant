import 'package:app/services/firebase_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DoctorInfo extends StatefulWidget {
  final String doctorId;

  DoctorInfo({@required this.doctorId});

  @override
  _DoctorInfoState createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  String doctorName;

  String spec;

  String desc;

  String doctorId = "4NeY92nMSnUzGUePydlXoSUNhD12";

  @override
  void initState() {
    super.initState();
    Firestore firestore = new Firestore();
    firestore.doctorReference.doc(doctorId).get().then((value) {
      setState(() {
        doctorName = value["doctorName"];
        spec = value["specialization"];
        desc = value["description"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Information",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: doctorName == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Position: " + spec),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Your ID: " + doctorId),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Your bio: \n" + desc),
                ],
              ),
            ),
    );
  }
}
