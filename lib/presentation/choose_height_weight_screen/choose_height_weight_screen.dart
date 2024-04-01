import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/choose_height_weight_controller.dart';

class ChooseHeightWeightScreen extends GetWidget<ChooseHeightWeightController> {
  const ChooseHeightWeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 11.v),
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
                        StepperData()
                      ]),
                  SizedBox(height: 39.v),
                  Text("lbl21".tr, style: theme.textTheme.headlineLarge),
                  SizedBox(height: 81.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 21.h, right: 33.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl22".tr,
                                    style: theme.textTheme.headlineLarge),
                                Text("lbl23".tr,
                                    style: theme.textTheme.headlineLarge)
                              ]))),
                  SizedBox(height: 51.v),
                  Padding(
                      padding: EdgeInsets.only(left: 27.h, right: 33.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildFour(
                                eightyTwo: "lbl_175".tr,
                                eightyOne: "lbl_174".tr,
                                eighty: "lbl_173".tr,
                                seventyNine: "lbl_1722".tr,
                                seventyEight: "lbl_171".tr),
                            _buildFour(
                                eightyTwo: "lbl_82".tr,
                                eightyOne: "lbl_81".tr,
                                eighty: "lbl_80".tr,
                                seventyNine: "lbl_79".tr,
                                seventyEight: "lbl_78".tr)
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
            margin: EdgeInsets.only(left: 22.h, top: 10.v, bottom: 21.v)),
        actions: [
          AppbarTitle(
              text: "lbl".tr,
              margin: EdgeInsets.fromLTRB(27.h, 13.v, 27.h, 10.v))
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

  /// Common widget
  Widget _buildFour({
    required String eightyTwo,
    required String eightyOne,
    required String eighty,
    required String seventyNine,
    required String seventyEight,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 16.v),
        decoration: AppDecoration.outlinePrimary1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder36),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(eightyTwo,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 21.v),
          Text(eightyOne,
              style: CustomTextStyles.bodyMediumNunitoBlack900
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 23.v),
          Text(eighty,
              style: CustomTextStyles.headlineSmallNunitoBlack900
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 20.v),
          Text(seventyNine,
              style: CustomTextStyles.bodyMediumNunitoBlack900
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 25.v),
          Text(seventyEight,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 9.v)
        ]));
  }

  /// Navigates to the specialQuestionsScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.specialQuestionsScreen,
    );
  }
}
