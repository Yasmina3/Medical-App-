import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 23.h,
              top: 112.v,
              right: 23.h,
              bottom:
                  20.v, // Added some padding at the bottom to avoid overflow
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("lbl6".tr, style: CustomTextStyles.titleLarge20),
                SizedBox(height: 91.v),
                CustomElevatedButton(text: "lbl12".tr),
                SizedBox(height: 39.v),
                CustomElevatedButton(
                  text: "msg11".tr,
                  onPressed: () {
                    onTaptf();
                  },
                ),
                SizedBox(height: 25.v),
             Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          onTapTxtWidget();
        },
        child: Text(
          "msg121".tr,
          style: CustomTextStyles.labelLargeBluegray800_1.copyWith(
            color: Colors.blue, // Set the color to blue
          ),
        ),
      ),
      Text(
        "msg12".tr,
        style: CustomTextStyles.labelLargeBluegray800_1,
      ),
     
    ],
  ),
),



                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 40.v,
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgButton,
          margin: EdgeInsets.symmetric(horizontal: 14.h),
        ),
      ],
    );
  }

  /// Navigates to the signUpOneScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.signUpOneScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtWidget() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
