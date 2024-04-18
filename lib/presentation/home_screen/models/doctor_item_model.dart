class DoctorItemModel {
  String id;
  String name;
  String email;
  String specialty;
  String location;

  DoctorItemModel({
    this.id = '',
    this.name = '',
    this.email = '',
    this.specialty = '',
    this.location = '',
  });

  factory DoctorItemModel.fromJson(Map<String, dynamic> json) {
    return DoctorItemModel(
      id: json['Doctor_id'].toString(),  // Convert int to String here
      name: json['full_name'] as String,
      email: json['email'] as String,
      specialty: json['speciality__name'] as String,
      location: json['location'] as String,
    );
  }
}
