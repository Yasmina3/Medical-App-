import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/utils/api_urls.dart';

Future<Map<String, dynamic>> resetPassword(String email) async {
  try {
    final response = await http.post(
      Uri.parse(Endpoints.resetPassword),
      body: {'email': email},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'success': false, 'message': 'Failed to reset password'};
    }
  } catch (e) {
    print('Error resetting password: $e');
    return {'success': false, 'message': 'An error occurred'};
  }
}
