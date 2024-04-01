import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_radio_button.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/special_questions_controller.dart';

class SpecialQuestionsScreen extends GetWidget<SpecialQuestionsController> {
  const SpecialQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 16.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 6.h),
                          child: AnotherStepper(
                              stepperDirection: Axis.horizontal,
                              activeIndex: 0,
                              barThickness: 5,
                              inverted: true,
                              stepperList: [
                                StepperData(),
                                StepperData(),
                                StepperData(),
                                StepperData()
                              ])),
                      SizedBox(height: 38.v),
                      Align(
                          alignment: Alignment.center,
                          child: Text("lbl24".tr,
                              style: theme.textTheme.headlineLarge)),
                      Spacer(flex: 46),
                      Container(
                          height: 12.adaptSize,
                          width: 12.adaptSize,
                          margin: EdgeInsets.only(right: 16.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.h),
                              border: Border.all(
                                  color: theme.colorScheme.primary,
                                  width: 1.h))),
                      SizedBox(height: 6.v),
                      Container(
                          margin: EdgeInsets.only(left: 271.h, right: 16.h),
                          padding: EdgeInsets.all(2.h),
                          decoration: AppDecoration.outlinePrimary2.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder6),
                          child: Container(
                              height: 6.adaptSize,
                              width: 6.adaptSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.h),
                                  gradient: LinearGradient(
                                      begin: Alignment(0.5, 0),
                                      end: Alignment(0.5, 1),
                                      colors: [
                                        theme.colorScheme.primary,
                                        theme.colorScheme.primary
                                      ])))),
                      SizedBox(height: 37.v),
                      Container(
                          width: 194.h,
                          margin: EdgeInsets.only(right: 5.h),
                          child: Text("msg15".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleSmallNunitoBlack900
                                  .copyWith(height: 1.13))),
                      SizedBox(height: 3.v),
                      _buildGroup243(),
                      SizedBox(height: 32.v),
                      Container(
                          width: 155.h,
                          margin: EdgeInsets.only(right: 6.h),
                          child: Text("msg16".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleSmallNunitoBlack900
                                  .copyWith(height: 1.13))),
                      SizedBox(height: 2.v),
                      _buildGroup244(),
                      Spacer(flex: 53)
                    ])),
            bottomNavigationBar: _buildTf()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 374.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeftGray900,
            margin: EdgeInsets.fromLTRB(22.h, 15.v, 328.h, 16.v)));
  }

  /// Section Widget
  Widget _buildGroup243() {
    return Padding(
        padding: EdgeInsets.only(left: 235.h, right: 15.h),
        child: Obx(() => Column(children: [
              CustomRadioButton(
                  width: 48.h,
                  text: "lbl25".tr,
                  value: controller
                      .specialQuestionsModelObj.value.radioList.value[0],
                  groupValue: controller.radioGroup.value,
                  isRightCheck: true,
                  onChange: (value) {
                    controller.radioGroup.value = value;
                  }),
              Padding(
                  padding: EdgeInsets.only(left: 9.h),
                  child: CustomRadioButton(
                      text: "lbl26".tr,
                      value: controller
                          .specialQuestionsModelObj.value.radioList.value[1],
                      groupValue: controller.radioGroup.value,
                      onChange: (value) {
                        controller.radioGroup.value = value;
                      }))
            ])));
  }

  /// Section Widget
  Widget _buildGroup244() {
    return Padding(
        padding: EdgeInsets.only(left: 235.h, right: 15.h),
        child: Obx(() => Column(children: [
              CustomRadioButton(
                  width: 48.h,
                  text: "lbl25".tr,
                  value: controller
                      .specialQuestionsModelObj.value.radioList1.value[0],
                  groupValue: controller.radioGroup1.value,
                  isRightCheck: true,
                  onChange: (value) {
                    controller.radioGroup1.value = value;
                  }),
              Padding(
                  padding: EdgeInsets.only(left: 9.h),
                  child: CustomRadioButton(
                      text: "lbl26".tr,
                      value: controller
                          .specialQuestionsModelObj.value.radioList1.value[1],
                      groupValue: controller.radioGroup1.value,
                      onChange: (value) {
                        controller.radioGroup1.value = value;
                      }))
            ])));
  }

  /// Section Widget
  Widget _buildTf() {
    return CustomElevatedButton(
        height: 59.v,
        width: 149.h,
        text: "lbl27".tr,
        margin: EdgeInsets.only(left: 113.h, right: 113.h, bottom: 44.v),
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.titleMediumNunitoOnPrimaryExtraBold,
        onPressed: () {
          onTaptf();
        });
  }

  /// Navigates to the doneScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.doneScreen,
    );
  }
}
