import 'package:app/components/patient_card.dart';
import 'package:app/services/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key key}) : super(key: key);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  Firestore firestore = new Firestore();
  Stream<QuerySnapshot<Object>> _stream;

  @override
  void initState() {
    _stream = firestore.patientReference.snapshots();
    print("==== $_stream ====");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return (snapshot.data == null)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var document = snapshot.data.docs[index];
                    return PatientCard(
                      patientName:
                          document["lastName"] + " " + document["firstName"],
                      birthdate: document["birthDate"],
                      fType: document["fType"],
                    );
                  },
                );
        },
      ),
    );
  }
}
