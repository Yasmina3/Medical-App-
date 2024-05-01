import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/utils/api_urls.dart';

Future<List<Map<String, dynamic>>?> endpoint_api_top_doctors() async {
  try {
    print("salam Getting Movies");
    final response = await http.get(Uri.parse(Endpoints.get_top_doctors));
    print("response ;  ${response.statusCode}");
    print("wii");
    if (response.statusCode == 200) {
      print("-${response.body}-");
      List<Map<String, dynamic>> ret =
          List<Map<String, dynamic>>.from(jsonDecode(response.body));

      return ret;
    }
  } catch (error) {
    print("Error yes ${error.toString()}");
    return null;
  }
  return null;
}
