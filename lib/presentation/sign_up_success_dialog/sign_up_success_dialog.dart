import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/sign_up_success_controller.dart';
import 'package:get/get.dart';
import "../UserController.dart";

// ignore_for_file: must_be_immutable
class SignUpSuccessDialog extends StatelessWidget {
  SignUpSuccessDialog(this.controller, {Key? key}) : super(key: key);

  SignUpSuccessController controller;


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
              child: Container(
                  width: 327.h,
                  padding:
                  EdgeInsets.symmetric(horizontal: 72.h, vertical: 38.v),
                  decoration: AppDecoration.fillOnPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder24),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 22.v),
                    Container(
                        height: 102.adaptSize,
                        width: 102.adaptSize,
                        padding: EdgeInsets.symmetric(
                            horizontal: 29.h, vertical: 34.v),
                        decoration: AppDecoration.fillGray.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder51),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgCheckmarkPrimary,
                            height: 31.v,
                            radius: BorderRadius.circular(3.h),
                            alignment: Alignment.center)),
                    SizedBox(height: 41.v),
                    Text("msg13".tr, style: CustomTextStyles.titleLarge20),
                    SizedBox(height: 12.v),
                    Text("lbl14".tr,
                        style:
                        CustomTextStyles.titleMediumPrimaryContainerBold),
                    SizedBox(height: 44.v),
                    CustomElevatedButton(
                        text: "lbl15".tr,
                        buttonTextStyle:
                        CustomTextStyles.titleMediumOnPrimary_1,
                        onPressed: () {
                          onTaptf();
                        })
                  ])))
        ]);
  }

  /// Navigates to the chooseAgeScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.chooseAgeScreen,
    );
  }
}