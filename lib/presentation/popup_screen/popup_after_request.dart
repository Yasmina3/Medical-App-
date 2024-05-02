import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'controller/popup_controller.dart';

class PopupScreen2 extends GetWidget<PopupController> {
  const PopupScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("helo");

    Future<void> delayedNavigation() async {
      await Future.delayed(Duration(seconds: 3)); // Wait for 10 seconds
      Get.toNamed(AppRoutes.seeReservations); // Navigate to the specified route
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      delayedNavigation();
    });
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width, // Make it responsive
            padding: EdgeInsets.symmetric(
              horizontal: 41.h,
              vertical: 13.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 43.v),
                Container(
                  height: 103.adaptSize,
                  width: 103.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 29.h,
                    vertical: 34.v,
                  ),
                  decoration: AppDecoration.fillGray.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder51,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkPrimary,
                    height: 32.v,
                    radius: BorderRadius.circular(
                      3.h,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 44.v),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.seeReservations);
                  },
                  child: Text(
                    "Sucess".tr,
                    style: CustomTextStyles.titleLarge20,
                  ),
                ),
                SizedBox(height: 6.v),
                SizedBox(
                  width: 243.h,
                  child: Text(
                    "Request for reservation added succesfully".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTf() {
    return GestureDetector(
      onTap: (){
        print("hello worl");
        Get.toNamed(AppRoutes.seeReservations);
      }, // Navigate to login screen when button is tapped
      child: CustomElevatedButton(
        width: 200.h,
        text: "See status of my Reservations".tr,
        margin: EdgeInsets.only(
          left: 52.h,
          right: 30.h,
          bottom: 40.v,
        ),
        buttonTextStyle: CustomTextStyles.titleMediumOnPrimary_1,
      ),
    );
  }

}
