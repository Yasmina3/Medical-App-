import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/utils/api_urls.dart';

Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
  try {
    final response = await http.post(
      Uri.parse(Endpoints.verifyOtp),  // Make sure to define this endpoint in your api_urls.dart
      body: {'email': email, 'otp': otp},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'success': false, 'message': 'Failed to verify OTP'};
    }
  } catch (e) {
    print('Error verifying OTP: $e');
    return {'success': false, 'message': 'An error occurred'};
  }
}


