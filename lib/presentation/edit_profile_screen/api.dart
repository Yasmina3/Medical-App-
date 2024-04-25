import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/utils/api_urls.dart';

Future<String?> api_edit_profile({
  required int patient_id,
  required String fullName,
  required String password,
  required String email,
}) async {
  try {
    final response = await http
        .post(Uri.parse('${Endpoints.edit_profile}/$patient_id/'), body: {
      "full_name": fullName,
      "password": password,
      "email": email,
    });
    print(fullName);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  } catch (error) {
    print("Error yes ${error.toString()}");
    return null;
  }
}
