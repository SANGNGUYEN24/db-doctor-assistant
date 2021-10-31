import 'package:app/screens/login_success/login_success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

signUp(
    {@required BuildContext context,
    @required String email,
    @required String pass}) async {
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass);
    print("==== userCredential: $userCredential");
    if (userCredential != null) {
      Navigator.pop(context);
    }
  } catch (e) {
    print("Error: $e");
    return false;
  }
}

signIn(
    {@required BuildContext context,
    @required String email,
    @required String pass}) async {
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass);
    print("==== userCredential: $userCredential");
    if (userCredential != null) {
      Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
    }
  } catch (e) {
    print(e);
    return false;
  }
}
