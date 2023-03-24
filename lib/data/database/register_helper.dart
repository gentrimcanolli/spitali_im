import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterHelper {

  final userCollection = FirebaseFirestore.instance.collection('users');

  Future registerUser(UserModel userModel , String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: "${userModel.personalNo}@gmail.com",
        password: password);

    addUserDetails(userModel);
  }

  Future addUserDetails(UserModel userModel) async{
    await userCollection.add({
      'name' : userModel.name,
      'surname' : userModel.surname,
      'email' : userModel.email,
      'telephoneNo' : userModel.telephoneNo,
      'personalNo' : userModel.personalNo,
    });
  }

  Future userExists(String personalNo, String email, String telephoneNo) async {
    return await userCollection
        .where('personalNo', isEqualTo: personalNo)
        .where('email', isEqualTo: email)
        .where('telephoneNo', isEqualTo: telephoneNo)
        .get()
        .then((value) => value.size > 0 ? true : false);
  }
}
