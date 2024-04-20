import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tabibak/core/app_export.dart';
import 'dart:convert';
import '../../core/utils/api_urls.dart';

Future<void> logout(BuildContext context) async {
  print("gudwhu");
  try {
    print("yakine");
    final response = await http.post(Uri.parse(Endpoints.logout_patient));
    print("nor");

    if (response.statusCode == 200) {
      print('Logged out successfully');
      Navigator.of(context).pushNamed(AppRoutes.signUpScreen);
    } else {
      print('Logout failed: ${response.statusCode}');
    }
  } catch (error) {
    print('Error logging out: $error');
  }
}
