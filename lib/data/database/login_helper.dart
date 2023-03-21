import 'package:cloud_firestore/cloud_firestore.dart';

class LoginHelper {
  final userCollection = FirebaseFirestore.instance.collection('users');
  Future loginUser(String personalNo, String password) async {
    QuerySnapshot snapshot =
        await userCollection.where('personalNo', isEqualTo: personalNo).get();

    if (snapshot.docs.isEmpty) {
      return false;
    }

    DocumentSnapshot userDocument = snapshot.docs.first;
    Map<String, dynamic> userData = userDocument.data() as Map<String, dynamic>;
    String storedPassword = userData['password'];

    if (password == storedPassword) {
      return true;
    } else {
      return false;
    }
  }
}
