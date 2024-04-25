import '../../../core/app_export.dart';
import '../models/all_doctors_model.dart';

/// A controller class for the AllDoctorsScreen.
///
/// This class manages the state of the AllDoctorsScreen, including the
/// current allDoctorsModelObj
///
import '../../../core/app_export.dart';
import '../models/all_doctors_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/utils/api_urls.dart';
import '../models/fortyseven2_item_model.dart';
import '../../../core/utils/specialties.dart';



class AllDoctorsController extends GetxController {


  Rx<AllDoctorsModel> allDoctorsModelObj = AllDoctorsModel().obs;

  Future<void> fetchSpecialists(int spec_id) async {
    print("insdie fetch");
    try {

      String url = "${Endpoints.get_doctors_per_specialty}?spec_id=$spec_id";
      final response = await http.get(Uri.parse(url));
      print("after calling url=$url");
      print("response =${response.body}");

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseData = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        print('after hhhh');

        print("fetch specs ${responseData}");

        // Map the response data to your model format
        List<Fortyseven2ItemModel> specialists = responseData.map((data) {
          if(all_specs.containsKey(data["specialty_name"]))
          {
            String spec_name = data["specialty_name"];
            print("name =$spec_name");
            print("hello");
            String ar_name = all_specs[spec_name]["ar"];
            print(ar_name);
            print("name is $spec_name in arabic $ar_name");
            return Fortyseven2ItemModel(
              drMarcusHorizon: Rx(data["full_name"]),
              widget : Rx(spec_name),

            );
          } else {
            return Fortyseven2ItemModel(

            );
          }
        }).toList();

        // Update the model with the mapped data
        allDoctorsModelObj.value.fortyseven2ItemList.value = specialists;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print("Error: $error");
      // Handle errors as needed
    }
  }
}
