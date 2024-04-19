import 'package:http/http.dart' as http;
import 'dart:convert';
import "../../core/utils/api_urls.dart";


Future<Map<String, dynamic>?> endpoint_api_add_patient(String full_name,String password, String email,int gender,int height, int weight,int age,  String specs, String wilaya  ) async {
  //This can be improved by placing API endpoints into a constant dart file
  try {
    print("salam im in get room");
    print(Endpoints.add_patient
    );
    final response = await http.post(Uri.parse(
        Endpoints.add_patient),body:
    {
      "full_name" : full_name,
      "email"  : email,
      "password" : password,
      "gender" : gender.toString(),
      "age" : age.toString(),
      "height" : height.toString(),
      "weight" : weight.toString(),
      "specs"  : specs ,
      "wilaya" : wilaya ,
    }
    );
    print("response ;  ${response.statusCode}");
    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    }
  } catch (error) {
    print("Error yes ${error.toString()}");
    return null;
  }
  return null;
}

/*Future<bool> service_sync_cinemas() async {
  print("Running Cron Service to get Categories");
  List? remote_data = await endpoint_api_get_categories();
  print("1111111111111111111111111111111111111");

  if (remote_data != null) {
    print("22222222222222222222222222");
    print(remote_data[0]["Cinema_name"]);
    await DBCinemas.syncCinemas(remote_data as List<Map<String, dynamic>>);
    return true;
  }
  return false;
}*/

