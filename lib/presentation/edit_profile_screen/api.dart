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
    final response = await http.post(
      Uri.parse('${Endpoints.edit_profile}/$patient_id/'),
      body: jsonEncode({
        "full_name": fullName,
        "password": password,
        "email": email,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // If the status code is 200, the profile update was successful
      return null; // No error message
    } else if (response.statusCode == 403) {
      // If the status code is 403, indicating a forbidden error
      return 'Incorrect password'; // Return specific error message
    } else {
      // If any other status code is received, return a generic error message
      return 'An error occurred';
    }
  } catch (error) {
    // If an error occurs during the API call, return a generic error message
    print("Error: $error");
    return 'An error occurred';
  }
}
