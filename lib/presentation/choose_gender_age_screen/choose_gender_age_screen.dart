import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/choose_gender_age_controller.dart';

class ChooseGenderAgeScreen extends GetWidget<ChooseGenderAgeController> {
  const ChooseGenderAgeScreen({Key? key}) : super(key: key);

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
                      iconHeight: 15,
                      iconWidth: 15,
                      stepperDirection: Axis.horizontal,
                      activeIndex: 0,
                      barThickness: 5,
                      inverted: true,
                      stepperList: [
                        StepperData(
                            iconWidget: SizedBox(
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.h),
                                                  gradient: LinearGradient(
                                                      begin: Alignment(0.5, 0),
                                                      end: Alignment(0.5, 1),
                                                      colors: [
                                                        theme.colorScheme
                                                            .primary,
                                                        appTheme.blueA700
                                                      ])))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.h),
                                                  gradient: LinearGradient(
                                                      begin: Alignment(0.5, 0),
                                                      end: Alignment(0.5, 1),
                                                      colors: [
                                                        theme.colorScheme
                                                            .primary,
                                                        appTheme.blueA700
                                                      ]))))
                                    ]))),
                        StepperData(
                            iconWidget: SizedBox(
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.h),
                                                  gradient: LinearGradient(
                                                      begin: Alignment(0.5, 0),
                                                      end: Alignment(0.5, 1),
                                                      colors: [
                                                        theme.colorScheme
                                                            .primary,
                                                        appTheme.blueA700
                                                      ])))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.h),
                                                  gradient: LinearGradient(
                                                      begin: Alignment(0.5, 0),
                                                      end: Alignment(0.5, 1),
                                                      colors: [
                                                        theme.colorScheme
                                                            .primary,
                                                        appTheme.blueA700
                                                      ]))))
                                    ]))),
                        StepperData(
                            iconWidget: SizedBox(
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.h),
                                                  gradient: LinearGradient(
                                                      begin: Alignment(0.5, 0),
                                                      end: Alignment(0.5, 1),
                                                      colors: [
                                                        theme.colorScheme
                                                            .primary,
                                                        appTheme.blueA700
                                                      ])))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.h),
                                                  gradient: LinearGradient(
                                                      begin: Alignment(0.5, 0),
                                                      end: Alignment(0.5, 1),
                                                      colors: [
                                                        theme.colorScheme
                                                            .primary,
                                                        appTheme.blueA700
                                                      ]))))
                                    ]))),
                        StepperData(
                            iconWidget: SizedBox(
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.h),
                                                  gradient: LinearGradient(
                                                      begin: Alignment(0.5, 0),
                                                      end: Alignment(0.5, 1),
                                                      colors: [
                                                        theme.colorScheme
                                                            .primary,
                                                        appTheme.blueA700
                                                      ])))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 15.adaptSize,
                                              width: 15.adaptSize,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.h),
                                                  gradient: LinearGradient(
                                                      begin: Alignment(0.5, 0),
                                                      end: Alignment(0.5, 1),
                                                      colors: [
                                                        theme.colorScheme
                                                            .primary,
                                                        appTheme.blueA700
                                                      ]))))
                                    ])))
                      ]),
                  SizedBox(height: 45.v),
                  Text("lbl17".tr, style: theme.textTheme.headlineLarge),
                  SizedBox(height: 40.v),
                  Padding(
                      padding: EdgeInsets.only(left: 27.h, right: 14.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: 93.v,
                                width: 105.h,
                                child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 93.v,
                                              width: 105.h,
                                              decoration: BoxDecoration(
                                                  color: appTheme.indigo900,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          52.h)))),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 23.v),
                                              child: Text("lbl18".tr,
                                                  style: CustomTextStyles
                                                      .headlineLargeOnPrimary)))
                                    ])),
                            SizedBox(
                                height: 93.v,
                                width: 105.h,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 93.v,
                                              width: 105.h,
                                              decoration: BoxDecoration(
                                                  color: theme.colorScheme
                                                      .errorContainer,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          52.h)))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text("lbl19".tr,
                                              style: CustomTextStyles
                                                  .headlineLargeOnPrimary))
                                    ]))
                          ])),
                  SizedBox(height: 65.v),
                  Text("lbl20".tr, style: theme.textTheme.headlineLarge),
                  SizedBox(height: 21.v),
                  Container(
                      margin: EdgeInsets.only(left: 124.h, right: 129.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.h, vertical: 11.v),
                      decoration: AppDecoration.outlinePrimary1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder24),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("lbl_162".tr,
                                style: theme.textTheme.bodySmall),
                            SizedBox(height: 12.v),
                            Text("lbl_172".tr,
                                style:
                                    CustomTextStyles.bodyMediumNunitoBlack900),
                            SizedBox(height: 11.v),
                            Text("lbl_182".tr,
                                style: CustomTextStyles
                                    .headlineSmallNunitoBlack900),
                            SizedBox(height: 6.v),
                            Text("lbl_192".tr,
                                style:
                                    CustomTextStyles.bodyMediumNunitoBlack900),
                            SizedBox(height: 13.v),
                            Text("lbl_202".tr,
                                style: theme.textTheme.bodySmall),
                            SizedBox(height: 4.v)
                          ])),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildTf()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 46.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeft,
            margin: EdgeInsets.only(left: 22.h, top: 12.v, bottom: 19.v)),
        actions: [
          AppbarTitle(
              text: "lbl".tr,
              margin: EdgeInsets.symmetric(horizontal: 26.h, vertical: 12.v))
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

  /// Navigates to the chooseHeightWeightScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.chooseHeightWeightScreen,
    );
  }
}
