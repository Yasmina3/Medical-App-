import '../../../core/app_export.dart';
import '../models/top_doctor_model.dart';
import '../models/donations.dart';
import '../models/fortyseven_item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/utils/api_urls.dart';

class TopDoctorController extends GetxController {
  Rx<TopDoctorModel> topDoctorModelObj = TopDoctorModel().obs;

  /*Future<void> fetchDonations() async {
    try {
      final Uri url = Uri.parse('${Endpoints.getDonations}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);
        print(responseData);

        // Map the response data to your Donation model format
        List<Donation> donations = responseData.map((item) {
          return Donation.fromJson(item);
        }).toList();

        // Update the model with the mapped donations
        topDoctorModelObj.value.fortysevenItemList.value = donations.map((donation) {
          return FortysevenItemModel(
            drMarcusHorizon1: Rx(donation.title),
            widget: Rx(donation.description),
            chardiologist3: Rx(donation.image),
          );
        }).toList();
      } else {
        throw Exception('Failed to load donations');
      }
    } catch (error) {
      print("Error: $error");
      // Handle errors as needed
    }
  }
*/
}
