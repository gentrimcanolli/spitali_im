import 'package:crypt/crypt.dart';

class UserModel {
  String name;
  String surname;
  String personalNo;
  String telephoneNo;
  String email;
  String password;

  UserModel({
    required this.name,
    required this.surname,
    required this.personalNo,
    required this.telephoneNo,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'personalNo': personalNo,
      'telephoneNo': telephoneNo,
      'email': email,
      'password': generateSaltedHashPassword(password),
    };
  }

  static generateSaltedHashPassword(String password) {
    final saltedHash = Crypt.sha256(password, salt: "abcdefghijklmnop");
    return saltedHash.toString();
  }
}
