import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:tabibak/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/onboarding_three1_controller.dart';

class OnboardingThree1Screen extends GetWidget<OnboardingThree1Controller> {
  const OnboardingThree1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 39.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left : 20.0),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgVector,
                            height: 66.adaptSize,
                            width: 66.adaptSize,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 105.h)),
                      ),
                      SizedBox(height: 2.v),
                      Padding(
                        padding: const EdgeInsets.only(left:25.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 101.h),
                                child: Text("lbl".tr,
                                    style: theme.textTheme.headlineSmall))),
                      ),
                      SizedBox(height: 39.v),
                      Text("lbl4".tr, style: theme.textTheme.titleLarge),
                      SizedBox(height: 9.v),
                      Container(
                          width: 291.h,
                          margin: EdgeInsets.only(right: 5.h),
                          child: Text("msg2".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodyLargeGray600
                                  .copyWith(height: 1.50))),
                      SizedBox(height: 79.v),
                      CustomElevatedButton(
                          text: "lbl5".tr,
                          margin: EdgeInsets.symmetric(horizontal: 16.h),
                          buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
                          onPressed: () {
                            onTaptf();
                          }),
                      SizedBox(height: 16.v),
                      CustomOutlinedButton(
                          text: "lbl6".tr,
                          margin: EdgeInsets.symmetric(horizontal: 16.h),
                          buttonStyle: CustomButtonStyles.outlinePrimary,
                          buttonTextStyle: CustomTextStyles.titleLargePrimary,
                          onPressed: () {
                            onTaptf1();
                          }),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTaptf1() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
