import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'controller/popup_controller.dart';

class PopupScreen extends GetWidget<PopupController> {
  const PopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hide keyboard when page is built
    FocusScope.of(context).unfocus();

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
                Text(
                  "lbl34".tr,
                  style: CustomTextStyles.titleLarge20,
                ),
                SizedBox(height: 6.v),
                SizedBox(
                  width: 243.h,
                  child: Text(
                    "msg27".tr,
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
        bottomNavigationBar: _buildTf(),
      ),
    );
  }

  Widget _buildTf() {
    return GestureDetector(
      onTap: onTaptf, // Navigate to login screen when button is tapped
      child: CustomElevatedButton(
        width: 183.h,
        text: "lbl5".tr,
        margin: EdgeInsets.only(
          left: 52.h,
          right: 72.h,
          bottom: 40.v,
        ),
        buttonTextStyle: CustomTextStyles.titleMediumOnPrimary_1,
      ),
    );
  }

  void onTaptf() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}
