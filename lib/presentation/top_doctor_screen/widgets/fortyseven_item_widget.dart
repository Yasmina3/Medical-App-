import '../models/fortyseven_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:flutter/material.dart';

class FortysevenItemWidget extends StatelessWidget {
  final Map<dynamic, dynamic> doctorData;

  FortysevenItemWidget({required this.doctorData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              doctorData['gender'] == 'F'
                  ? "assets/images/DocF.png" // Path for female
                  : "assets/images/DocM.png", // Path for male
              width: 100.adaptSize,
              height: 100.adaptSize,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorData['full_name'],
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 8.0),
                Text(
                  doctorData['speciality_name'],
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/img_linkedin.svg",
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.h, top: 3.v),
                      child: Text(
                        doctorData['location'] ?? "",
                        style: CustomTextStyles.interGray500
                            .copyWith(fontSize: 15.0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
