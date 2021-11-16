import 'package:app/components/patient_card.dart';
import 'package:app/services/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SearchResult extends StatefulWidget {
  final String searchName;

  const SearchResult({Key key, @required this.searchName}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  Firestore firestore = new Firestore();
  Stream<QuerySnapshot<Object>> _stream;
  @override
  void initState() {
    super.initState();
    _stream = firestore.patientReference.snapshots();
    print("==== $_stream ====");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search with: " + widget.searchName,
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return (snapshot.data == null)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: snapshot.data.docs.length - 2,
                  itemBuilder: (context, index) {
                    var document = snapshot.data.docs[index];
                    print("---------------------------------");
                    print(document["firstName"]);
                    return PatientCard(
                      patientId: document["patientId"],
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
