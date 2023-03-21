class AppointmentModel {
  String date;
  String time;
  String department;
  String doctor;
  String patient;

  AppointmentModel({
    required this.date,
    required this.time,
    required this.department,
    required this.doctor,
    required this.patient,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      date: json['date'],
      time: json['time'],
      department: json['department'],
      doctor: json['doctor'],
      patient: json['patient'],
    );
  }
}
