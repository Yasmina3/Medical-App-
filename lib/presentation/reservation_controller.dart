import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TopDoctorController extends GetxController {
  var reservations = [].obs;

  Future<void> fetchReservations(int patientId) async {
    print("wiiii");
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/Endpoints/get_reservations_per_patient?patient_id=1'));
    if (response.statusCode == 200) {
      reservations.value = json.decode(response.body)['reservations'];
      print(reservations.value);
    } else {
      throw Exception('Failed to load reservations');
    }
  }
}
