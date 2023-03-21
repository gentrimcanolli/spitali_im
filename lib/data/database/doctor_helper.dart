import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/doctor_model.dart';

class DoctorHelper {
  final doctorCollection = FirebaseFirestore.instance.collection('doctors');
  Future<List<DoctorModel>> getDoctorList() async {
    QuerySnapshot snapshot = await doctorCollection.get();

    return snapshot.docs
        .map((doc) => DoctorModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
