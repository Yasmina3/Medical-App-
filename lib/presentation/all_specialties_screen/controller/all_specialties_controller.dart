import '../../../core/app_export.dart';
import '../models/all_specialties_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/utils/api_urls.dart';
import '../models/widget_item_model.dart';

class AllSpecialtiesController extends GetxController {
  Rx<AllSpecialtiesModel> allSpecialtiesModelObj = AllSpecialtiesModel().obs;

  Future<void> fetchSpecialties() async {
    print("insdie fetch");
    try {
      final response = await http.get(Uri.parse(Endpoints.get_all_specialties));
      print("after calling");
      print("response =${response.body}");

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseData = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        print('after hhhh');

        print("fetch specs ${responseData}");

        // Map the response data to your model format
        List<WidgetItemModel> specialties = responseData.map((data) => WidgetItemModel(
          widget: Rx(data['specialty_name']),
        )).toList();

        // Update the model with the mapped data
        allSpecialtiesModelObj.value.widgetItemList.value = specialties;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print("Error: $error");
      // Handle errors as needed
    }
  }
}
