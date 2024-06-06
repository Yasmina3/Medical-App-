import '../models/fortyseven_item_model.dart';
import '../controller/top_doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

class FortysevenItemWidget extends StatelessWidget {
  final FortysevenItemModel fortysevenItemModelObj;

  FortysevenItemWidget(this.fortysevenItemModelObj, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {
              // Handle the tap action to show details
            },
            child: Container(
              height: 111.adaptSize, // Set height to match the image height
              padding: EdgeInsets.symmetric(horizontal: 21.h),
              decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Obx(
                            () => Text(
                          fortysevenItemModelObj.drMarcusHorizon1!.value,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Padding(
                      padding: EdgeInsets.only(left: 29.h),
                      child: Obx(
                            () => Text(
                         "Description ${fortysevenItemModelObj.widget!.value}",
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.v),
                    Padding(
                      padding: EdgeInsets.only(left: 29.h),
                      child: Obx(
                            () => Text(
                          "Phone Number: ${fortysevenItemModelObj.phonenumber!.value}",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.v),
                    Padding(
                      padding: EdgeInsets.only(left: 29.h),
                      child: Obx(
                            () => Text(
                          "Wilaya: ${fortysevenItemModelObj.wilaya!.value}",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Obx(
              () => _buildImage(fortysevenItemModelObj.chardiologist3!.value),
        ),
      ],
    );
  }

  Widget _buildImage(String imagePath) {
    try {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.h),
        child: CustomImageView(
          imagePath: imagePath,
          height: 111.adaptSize,
          width: 111.adaptSize,
          margin: EdgeInsets.only(top: 8.v, bottom: 6.v),
        ),
      );
    } catch (e) {
      print("Error loading image: $e");
      return Container(); // Empty container
    }
  }

}
