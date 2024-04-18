import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/presentation/home_screen/controller/home_controller.dart';
  // Adjust path as needed
class AllDoctorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: Text("All Doctors")),
      body: Obx(() => ListView.builder(
        itemCount: homeController.homeModelObj.value.doctors.length,
        itemBuilder: (context, index) {
          var doctor = homeController.homeModelObj.value.doctors[index];
          return ListTile(
            title: Text(doctor.name),
            subtitle: Text(doctor.specialty),
            onTap: () => print("Tapped on doctor ${doctor.name}"),
          );
        },
      )),
    );
  }
}
