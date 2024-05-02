import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/login_success_controller.dart';

// ignore_for_file: must_be_immutable
class LoginSuccessDialog extends StatelessWidget {
  LoginSuccessDialog(this.controller, {Key? key}) : super(key: key);

  LoginSuccessController controller;

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
                      EdgeInsets.symmetric(horizontal: 29.h, vertical: 40.v),
                  decoration: AppDecoration.fillOnPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder24),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 18.v),
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
                    SizedBox(height: 42.v),
                    Text("lbl10".tr, style: theme.textTheme.titleLarge),
                    SizedBox(height: 1.v),
                    SizedBox(
                        width: 264.h,
                        child: Text("msg10".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodyLarge_1
                                .copyWith(height: 1.50))),
                    SizedBox(height: 40.v),
                    CustomElevatedButton(
                        width: 183.h,
                        text: "lbl11".tr,
                        onPressed: () {
                          onTaptf();
                        })
                  ])))
        ]);
  }

  /// Navigates to the homeScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }
}
