import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/fortyseven_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'reservation_controller.dart';
import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/fortyseven_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/core/utils/specialties.dart';


// ignore_for_file: must_be_immutable
class Tops extends GetWidget<TopController> {
  @override
  Widget build(BuildContext context) {
    print("enteredd");
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.only(
            top: 15.v,
            right: 11.h,
          ),
          child: FutureBuilder(
            future: controller.fetchReservations(2), // Pass the patient ID here
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                print("entered");
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.reservations.length,
                  itemBuilder: (context, index) {
                    var reservation = controller.reservations[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey[400]!, // Adjust border color as needed
                          width: 1.0,
                        ),
                        color: reservation['state'] == 'requested' ? Colors.orange : Colors.green,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl, // Set text direction to right-to-left
                        child: ListTile(
                          title: Text(
                            'الدكتور: ${reservation['doctor_name']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'الوقت: ${reservation['session_time']}',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          // Add more information if needed
                        ),
                      ),
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

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('Reservations'),
    );
  }

// Your _buildAppBar function remains the same
}