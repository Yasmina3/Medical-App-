import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/utils/api_urls.dart';

Future<void> updatePassword(String email, String newPassword) async {
  final response = await http.post(
    Uri.parse(Endpoints.updatePassword),
    body: {
      'email': email,
      'new_password': newPassword,
    },
  );

  if (response.statusCode == 200) {
    // Password updated successfully
    print('Password updated successfully');
  } else {
    // Handle errors
    print('Failed to update password: ${response.body}');
  }
}
