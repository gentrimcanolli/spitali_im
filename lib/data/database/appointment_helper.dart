import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/appointment_model.dart';

class AppointmentHelper {
  final appointmentCollection =
      FirebaseFirestore.instance.collection('appointments');

  Future<List<AppointmentModel>> getAppointments(String patientId) async {
    QuerySnapshot snapshot = await appointmentCollection
        .where('patient', isEqualTo: patientId)
        .orderBy('time')
        .get();

    return snapshot.docs
        .map((doc) =>
            AppointmentModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future bookAppointment(AppointmentModel appointmentModel) async {
    await appointmentCollection.add({
      'date': appointmentModel.date,
      'time': appointmentModel.time,
      'doctor': appointmentModel.doctor,
      'department': appointmentModel.department,
      'patient': appointmentModel.patient,
    });
  }

  Future discardAppointment(List appointmentList, String time) async {
    final QuerySnapshot snapshot =
        await appointmentCollection.where('time', isEqualTo: time).get();

    for (var doc in snapshot.docs) {
      doc.reference.delete();
    }

    appointmentList.removeWhere((item) => item.time == time);
  }
}
