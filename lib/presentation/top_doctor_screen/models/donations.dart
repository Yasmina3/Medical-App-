class Donation {
  final int donationId;
  final int patientId;
  final String description;
  final String title;
  final String image;
  final bool available;
  final String phoneNumber;
  final String wilaya;

  Donation({
    required this.donationId,
    required this.patientId,
    required this.description,
    required this.title,
    required this.image,
    required this.available,
    required this.phoneNumber,
    required this.wilaya,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      donationId: json['donation_id'],
      patientId: json['patient_id'],
      description: json['description'],
      title: json['title'],
      image: json['image'],
      available: json['available'],
      phoneNumber: json['phone_number'],
      wilaya: json['wilaya'],
    );
  }
}
