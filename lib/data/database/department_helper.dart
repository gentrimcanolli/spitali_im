import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/department_model.dart';
import '../models/doctor_model.dart';

class DepartmentHelper {
  final departmentCollection =
      FirebaseFirestore.instance.collection('departments');
  Future<DepartmentModel> getDepartmentDetails(String departmentId) async {
    DocumentSnapshot snapshot =
        await departmentCollection.doc(departmentId).get();

    return DepartmentModel(
      id: snapshot.get('id'),
      title: snapshot.get('title'),
      description: snapshot.get('description'),
    );
  }

  Future<List<DoctorModel>> getDepartmentDoctorList(String departmentId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('doctors')
        .where('department', isEqualTo: departmentId)
        .get();

    return snapshot.docs
        .map((doc) => DoctorModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
