import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../models/user_model.dart';

class RegisterHelper {
  final userCollection = FirebaseFirestore.instance.collection('users');

  Future registerUser(
      BuildContext context, UserModel userModel, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "${userModel.personalNo}@gmail.com", password: password);
      addUserDetails(userModel);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-exists') {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Provo perseri!",
          text: "Ky perdorues ekziston!",
        );
      } else if (userModel.personalNo.isEmpty ||
          userModel.telephoneNo.isEmpty ||
          userModel.email.isEmpty ||
          userModel.name.isEmpty ||
          userModel.surname.isEmpty) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Provo perseri!",
          text: "Plotesoni te gjitha fushat!",
        );
      }
    }
  }

  Future addUserDetails(UserModel userModel) async {
    await userCollection.add({
      'name': userModel.name,
      'surname': userModel.surname,
      'email': userModel.email,
      'telephoneNo': userModel.telephoneNo,
      'personalNo': userModel.personalNo,
    });
  }
}
