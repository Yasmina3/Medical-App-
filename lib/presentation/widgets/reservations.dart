import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/fortyseven_item_widget.dart';
import 'models/fortyseven_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/top_doctor_controller.dart';

// ignore_for_file: must_be_immutable
class Tops extends GetWidget<Tops> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.only(
            top: 15.v,
            right: 11.h,
          ),
          child: FutureBuilder(
            future: controller.fetchReservations(1), // Pass the patient ID here
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.reservations.length,
                  itemBuilder: (context, index) {
                    var reservation = controller.reservations[index];
                    return ListTile(
                      title: Text('Reservation ID: ${reservation['reservation_id']}'),
                      subtitle: Text('Session ID: ${reservation['session_id']}'),
                      // Add more information if needed
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

// Your _buildAppBar function remains the same
}

