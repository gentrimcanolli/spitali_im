import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spitali_im/data/models/doctors_model.dart';

import 'departments_model.dart';

class DBHelper {
  static Future<DepartmentsModel> getDepartmentDetails(
      String departmentId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('departments')
        .doc(departmentId)
        .get();

    return DepartmentsModel(
      id: snapshot.get('id'),
      title: snapshot.get('title'),
      description: snapshot.get('description'),
    );
  }

  static Future<List<DoctorsModel>> getDepartmentDoctorList(
      String departmentId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('doctors')
        .where('department', isEqualTo: departmentId)
        .get();

    return snapshot.docs
        .map((doc) => DoctorsModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  static Future<List<DoctorsModel>> getDoctorList() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('doctors').get();

    return snapshot.docs
        .map((doc) => DoctorsModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
