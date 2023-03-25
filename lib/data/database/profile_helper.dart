import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:spitali_im/ui/login/login.dart';

import '../models/user_model.dart';

class ProfileHelper {
  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<UserModel> getUserProfile(String userId) async {
    QuerySnapshot snapshot =
        await userCollection.where('personalNo', isEqualTo: userId).get();

    return UserModel(
      name: snapshot.docs[0]['name'],
      surname: snapshot.docs[0]['surname'],
      personalNo: snapshot.docs[0]['personalNo'],
      telephoneNo: snapshot.docs[0]['telephoneNo'],
      email: snapshot.docs[0]['email'],
    );
  }

  Future changePassword(BuildContext context, String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;

    await user?.updatePassword(newPassword).then((_) {
      QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              title: "Fjalekalimi",
              text:
                  "Fjalekalimi ka ndryshuar me sukses, ju do  te ktheheni ne faqen per kycje!",
              confirmBtnText: "Ne rregull")
          .then((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => LoginScreen(),
          ),
        );
      });
    });
  }
}
