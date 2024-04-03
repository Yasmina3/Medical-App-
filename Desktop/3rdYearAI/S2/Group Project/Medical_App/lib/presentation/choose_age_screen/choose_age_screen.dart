import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/choose_age_controller.dart';

class ChooseAgeScreen extends GetWidget<ChooseAgeController> {
  const ChooseAgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 13.v),
                child: Column(children: [
                  AnotherStepper(
                      stepperDirection: Axis.horizontal,
                      activeIndex: 0,
                      barThickness: 5,
                      inverted: true,
                      stepperList: [
                        StepperData(),
                        StepperData(),
                        StepperData(),
                        StepperData(),
                        StepperData()
                      ]),
                  Spacer(),
                  Container(
                      height: 200.v,
                      width: 198.h,
                      decoration: AppDecoration.outlinePrimary.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder99),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgChangeImage,
                          width: 198.h,
                          radius: BorderRadius.circular(99.h),
                          alignment: Alignment.center)),
                  SizedBox(height: 72.v),
                  Text("msg14".tr, style: theme.textTheme.headlineLarge),
                  SizedBox(height: 41.v),
                  CustomElevatedButton(
                      height: 39.v,
                      text: "lbl_momoh_mdj".tr,
                      margin: EdgeInsets.only(left: 41.h, right: 40.h),
                      buttonStyle: CustomButtonStyles.none,
                      decoration: CustomButtonStyles
                          .gradientSecondaryContainerToPrimaryDecoration,
                      buttonTextStyle:
                          CustomTextStyles.titleMediumNunitoOnPrimary),
                  SizedBox(height: 63.v)
                ])),
            bottomNavigationBar: _buildTf()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(actions: [
      AppbarTitle(
          text: "lbl".tr,
          margin: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.v))
    ]);
  }

  /// Section Widget
  Widget _buildTf() {
    return CustomElevatedButton(
        height: 59.v,
        width: 149.h,
        text: "lbl16".tr,
        margin: EdgeInsets.only(left: 113.h, right: 113.h, bottom: 44.v),
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.titleMediumNunitoOnPrimaryExtraBold,
        onPressed: () {
          onTaptf();
        });
  }

  /// Navigates to the chooseGenderAgeScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.chooseGenderAgeScreen,
    );
  }
}
