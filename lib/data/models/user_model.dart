import 'package:crypt/crypt.dart';

class UserModel {
  String name;
  String surname;
  String personalNo;
  String telephoneNo;
  String email;

  UserModel({
    required this.name,
    required this.surname,
    required this.personalNo,
    required this.telephoneNo,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'personalNo': personalNo,
      'telephoneNo': telephoneNo,
      'email': email,
    };
  }
}
