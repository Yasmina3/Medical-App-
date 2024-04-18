import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tabibak/presentation/home_screen/models/home_model.dart';
import 'package:tabibak/presentation/searchresultscreen/search.dart'; // Assuming you have this screen

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  Rx<HomeModel> homeModelObj = HomeModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  void searchDoctors() async {
    var url = Uri.parse('http://192.168.43.14:8000/Endpoints/search/doctors/?query=${searchController.text}');
    print('Requesting URL: $url');
    try {
      var response = await http.get(url);
      print('HTTP Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData is List) {
          homeModelObj.value = HomeModel.fromJson(jsonData);
          homeModelObj.refresh();

          // Print details for debugging
          jsonData.forEach((doctor) {
            print('Doctor ID: ${doctor['Doctor_id']}');
            print('Name: ${doctor['full_name']}');
            print('Email: ${doctor['email']}');
            print('Specialty: ${doctor['speciality__name']}');
            print('Location: ${doctor['location']}');
            print('---');
          });

          // Navigate to AllDoctorsScreen with the loaded doctors
          navigateToAllDoctorsScreen();
        } else {
          print('Unexpected JSON format: not a list');
        }
      } else {
        print('Failed to load doctors: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  void navigateToAllDoctorsScreen() {
    Get.to(() => AllDoctorsScreen());
  }
}
