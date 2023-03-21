import 'package:cloud_firestore/cloud_firestore.dart';
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
      password: "",
    );
  }

  Future changePassword(String personalNo, String newPassword) async {
    final snapshot =
        await userCollection.where('personalNo', isEqualTo: personalNo).get();

    if (snapshot.docs.isNotEmpty) {
      final userDoc = snapshot.docs.first;
      final userData = userDoc.data();
      userData['password'] = newPassword;

      await userDoc.reference.set(userData);
    }
  }
}
