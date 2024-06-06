import '../../../core/app_export.dart';
import '../models/top_doctor_model.dart';
import '../models/donations.dart';
import '../models/fortyseven_item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/utils/api_urls.dart';

class TopDoctorController extends GetxController {
  // Define observable object for the top doctor model
  Rx<TopDoctorModel> topDoctorModelObj = TopDoctorModel().obs;

  // Function to fetch donations from the server
  Future<void> fetchDonations() async {
    try {
      // Define the URL for fetching donations
      final Uri url = Uri.parse(Endpoints.getDonations);

      // Send GET request to the server
      final response = await http.get(url);

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Decode the JSON response body
        List<dynamic> responseData = jsonDecode(response.body);

        // Map the response data to your Donation model format
        List<Donation> donations = responseData.map((item) {
          return Donation.fromJson(item);
        }).toList();
    // Print the contents of each donation object
    donations.forEach((donation) {
    print('Phone Number: ${donation.phoneNumber}');
    print('Image: ${donation.image}');
    print('Description: ${donation.description}');
    });
        // Update the model with the mapped donations
        topDoctorModelObj.value.fortysevenItemList.value = donations.map((donation) {
          return FortysevenItemModel(
            drMarcusHorizon1: Rx(donation.title),
            widget: Rx(donation.description),
            chardiologist3: Rx(donation.image),
            wilaya: Rx(donation.wilaya),
            phonenumber: Rx(donation.phoneNumber)
          );
        }).toList();
      } else {
        // Handle HTTP error
        throw Exception('Failed to load donations: ${response.statusCode}');
      }
    } catch (error) {
      // Handle other errors
      print("Error fetching donations: $error");
      // You might want to notify the user or handle the error in some way
    }
  }
}
