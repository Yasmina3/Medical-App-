import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/done_controller.dart';

class DoneScreen extends GetWidget<DoneController> {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 17.v),
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
                  Spacer(flex: 55),
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
                  SizedBox(height: 32.v),
                  Text("msg17".tr, style: theme.textTheme.titleLarge),
                  Spacer(flex: 44)
                ])),
            bottomNavigationBar: _buildTf()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeft,
            margin: EdgeInsets.only(left: 16.h, top: 12.v, bottom: 19.v)),
        actions: [
          AppbarTitle(
              text: "lbl".tr,
              margin: EdgeInsets.symmetric(horizontal: 22.h, vertical: 12.v))
        ]);
  }

  /// Section Widget
  Widget _buildTf() {
    return CustomElevatedButton(
        width: 183.h,
        text: "lbl11".tr,
        margin: EdgeInsets.only(left: 96.h, right: 96.h, bottom: 45.v),
        onPressed: () {
          onTaptf();
        });
  }

  /// Navigates to the homeScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }
}
