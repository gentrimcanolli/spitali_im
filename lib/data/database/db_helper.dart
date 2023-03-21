import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spitali_im/data/models/doctor_model.dart';
import 'package:spitali_im/data/models/appointment_model.dart';

import '../models/department_model.dart';
import '../models/user_model.dart';

class DBHelper {
  final firebaseInstance = FirebaseFirestore.instance;

  Future<DepartmentModel> getDepartmentDetails(String departmentId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('departments')
        .doc(departmentId)
        .get();

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

  Future<List<DoctorModel>> getDoctorList() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('doctors').get();

    return snapshot.docs
        .map((doc) => DoctorModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  registerUser(UserModel userModel) {
    firebaseInstance.collection('users').doc().set(
          userModel.toMap(),
        );
  }

  Future changePassword(String personalNo, String newPassword) async {
    final userCollection = firebaseInstance.collection('users');

    final snapshot =
        await userCollection.where('personalNo', isEqualTo: personalNo).get();

    if (snapshot.docs.isNotEmpty) {
      final userDoc = snapshot.docs.first;
      final userData = userDoc.data();
      userData['password'] = newPassword;

      await userDoc.reference.set(userData);
    }
  }

  Future<bool> userExists(String personalNo, String email) async {
    return await firebaseInstance
        .collection('users')
        .where('personalNo', isEqualTo: personalNo)
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.size > 0 ? true : false);
  }

  Future<bool> loginUser(String personalNo, String password) async {
    QuerySnapshot snapshot = await firebaseInstance
        .collection('users')
        .where('personalNo', isEqualTo: personalNo)
        .get();

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

  Future<UserModel> getUserProfile(String userId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('personalNo', isEqualTo: userId)
        .get();

    return UserModel(
      name: snapshot.docs[0]['name'],
      surname: snapshot.docs[0]['surname'],
      personalNo: snapshot.docs[0]['personalNo'],
      telephoneNo: snapshot.docs[0]['telephoneNo'],
      email: snapshot.docs[0]['email'],
      password: "",
    );
  }

  Future<List<AppointmentModel>> getAppointments(String patientId) async {
    QuerySnapshot snapshot = await firebaseInstance
        .collection('appointments')
        .where('patient', isEqualTo: patientId)
        .orderBy('time')
        .get();

    return snapshot.docs
        .map((doc) =>
            AppointmentModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future bookAppointment(AppointmentModel appointmentModel) async {
    final appointmentCollection = firebaseInstance.collection('appointments');

    await appointmentCollection.add({
      'date': appointmentModel.date,
      'time': appointmentModel.time,
      'doctor': appointmentModel.doctor,
      'department': appointmentModel.department,
      'patient': appointmentModel.patient,
    });
  }

  Future discardAppointment(List appointmentList, String time) async {
    final QuerySnapshot snapshot = await firebaseInstance
        .collection('appointments')
        .where('time', isEqualTo: time)
        .get();

    for (var doc in snapshot.docs) {
      doc.reference.delete();
    }

    appointmentList.removeWhere((item) => item.time == time);
  }
}
