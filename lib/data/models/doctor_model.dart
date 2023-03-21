class DoctorModel {
  String name;
  String description;
  String department;
  bool available;

  DoctorModel({
    required this.name,
    required this.description,
    required this.department,
    required this.available,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      description: json['description'],
      department: json['department'],
      available: json['available'],
    );
  }
}
