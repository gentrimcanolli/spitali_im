import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';

class LoginHelper {
  final userCollection = FirebaseFirestore.instance.collection('users');

  Future loginUser(
      BuildContext context, String personalNo, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "$personalNo@gmail.com", password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Provo perseri!",
          text: "Perdoruesi nuk ekziston.",
        );
      } else if (e.code == 'wrong-password') {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Provo perseri!",
          text: "Kredencialet jane gabim.",
        );
      } else if (personalNo.isEmpty || password.isEmpty) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Provo perseri!",
          text: "Te gjitha fushat duhet te plotesohen.",
        );
      }
    }
  }
}
