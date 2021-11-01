import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestore {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String userId;
  CollectionReference patientReference;
  CollectionReference doctorReference;

  Firestore() {
    this.userId = firebaseAuth.currentUser.uid;
    this.patientReference = firebaseFirestore.collection("Patient");
    this.doctorReference = firebaseFirestore.collection("Doctor");
  }

  getTreatingPatient({String userId}) async {
    return await firebaseFirestore
        .collection("Doctor")
        .doc(userId)
        .get()
        .then((value) => value["treatingPatient"]);
  }

  getAllYourPatient({var arrayPatient}) async {
    List<Map<dynamic, dynamic>> data;
    await for (final patient in arrayPatient) {
      patientReference.doc(patient).get().then((value) {
        data.add({
          "patientId": value["patientId"],
          "firstName": value["firstName"],
          "lastName": value["lastName"],
          "birthDate": value["birthDate"]
        });
      });
      print(data);
    }
    return data;
  }
}
