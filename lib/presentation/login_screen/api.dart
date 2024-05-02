import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/utils/api_urls.dart';

Future<Map<String, dynamic>?> loginUser(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse(Endpoints.login),
      body: {
        'email': email,
        'password': password,
      },
    );
    print("response: ${response.statusCode}");
    if (response.statusCode == 200) {
      print("-${response.body}-");
      Map<String, dynamic> ret = jsonDecode(response.body);
      return ret;
    } else {
      print("Error: ${response.body}");
      return null;
    }
  } catch (error) {
    print("Error: ${error.toString()}");
    return null;
  }
}

