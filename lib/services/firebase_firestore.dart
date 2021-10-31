import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestore {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String userId;
  CollectionReference patientReference;

  Firestore() {
    this.userId = firebaseAuth.currentUser.uid;
    this.patientReference = firebaseFirestore.collection("Patient");
  }
}
