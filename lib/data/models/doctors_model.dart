class DoctorsModel {
  // String id;
  String name;
  String description;
  String department;
  bool available;

  DoctorsModel({
    // required this.id,
    required this.name,
    required this.description,
    required this.department,
    required this.available,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      // id: json['id'],
      name: json['name'],
      description: json['description'],
      department: json['department'],
      available: json['available'],
    );
  }
}
