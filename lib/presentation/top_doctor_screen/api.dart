import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/utils/api_urls.dart';

Future<void> addDonation(
    String description,
    String title,
    String image,
    String wilaya,
    String phoneNumber,
    int patientId,
    ) async {
  final Uri url = Uri.parse(Endpoints.addDonation);

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json', // Set the content type to JSON
    },
    body: jsonEncode({
      'description': description,
      'title': title,
      'image': image,
      'wilaya': wilaya,
      'phoneNumber': phoneNumber,
      'patientId': patientId.toString(),
    }),
  );

  if (response.statusCode == 200) {
    // Decode the response body to get the actual data
    Map<String, dynamic> data = jsonDecode(response.body);
    if (data['success']) {
      // Donation added successfully
    } else {
      // Handle error
      throw Exception(data['message']);
    }
  } else {
    // Handle error
    throw Exception('Failed to add donation');
  }
}


Future<List<Donation>> fetchDonations({String? wilaya}) async {
  final Uri url = Uri.parse('${Endpoints.getDonations}?wilaya=$wilaya');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<Donation> donations = data.map((item) => Donation.fromJson(item)).toList();
    return donations;
  } else {
    // Handle error
    throw Exception('Failed to load donations');
  }
}

class Donation {
  final int id;
  final String description;
  final String title;
  final String image;
  final bool available;
  final String wilaya;
  final String phoneNumber;
  final int patientId;

  Donation({
    required this.id,
    required this.description,
    required this.title,
    required this.image,
    required this.available,
    required this.wilaya,
    required this.phoneNumber,
    required this.patientId,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      image: json['image'],
      available: json['available'],
      wilaya: json['wilaya'],
      phoneNumber: json['phoneNumber'],
      patientId: json['patientId'],
    );
  }
}

Future<void> takeDonation(int donationId, int posterPatientId) async {
  final Uri url = Uri.parse('${Endpoints.takeDonation}/');

  final response = await http.post(
    url,
    body: {
      'donationId': donationId.toString(),
      'posterPatientId': posterPatientId.toString(),
    },
  );

  if (response.statusCode == 200) {
    // Donation taken successfully
  } else {
    // Handle error
    throw Exception('Failed to take donation');
  }
}
