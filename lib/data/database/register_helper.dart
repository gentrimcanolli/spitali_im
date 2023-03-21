import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class RegisterHelper {
  final userCollection = FirebaseFirestore.instance.collection('users');
  Future registerUser(UserModel userModel) async {
    await userCollection.doc().set(
          userModel.toMap(),
        );
  }

  Future userExists(String personalNo, String email) async {
    return await userCollection
        .where('personalNo', isEqualTo: personalNo)
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.size > 0 ? true : false);
  }
}
