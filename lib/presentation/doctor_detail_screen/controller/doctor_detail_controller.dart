import '../../../core/app_export.dart';
import '../models/doctor_detail_model.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import '../../../core/app_export.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/utils/api_urls.dart';
import '../../../core/utils/specialties.dart';
/// A controller class for the DoctorDetailScreen.
///
/// This class manages the state of the DoctorDetailScreen, including the
/// current doctorDetailModelObj
class DoctorDetailController extends GetxController {
  Rx<DoctorDetailModel> doctorDetailModelObj = DoctorDetailModel().obs;

  Rx<DateTime> selectedDatesFromCalendar1 = DateTime.now().obs;
  Rx<int> selectedDate = Rx(1);

  RxList<DateTime> Sessions_per_day = RxList<DateTime>();

  Future<Map<String, dynamic>?> fetchFromDetails(int doctor_id) async {
    print("insdie fetch");
    try {
      String url = "${Endpoints.get_slots_per_doctor}?doctor_id=$doctor_id";
      final response = await http.get(Uri.parse(url));
      print("after calling url=$url");
      print("response =${response.body}");

      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print("Error: $error");
      // Handle errors as needed
      return null; // Return null or handle error
    }
  }





}
