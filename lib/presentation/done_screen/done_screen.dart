
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
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 17.v),
                child: Column(children: [
                  AnotherStepper(
                      stepperDirection: Axis.horizontal,
                      activeIndex: 4,
                      barThickness: 5,
                      inverted: true,
                      stepperList: [
                        StepperData(),
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back), // Use Material Icons' arrow_back icon
      onPressed: () => Navigator.of(context).pop(), // Navigate back on press
    ),
    actions: <Widget>[
      AppbarTitle(
              text: "lbl".tr,
              margin: EdgeInsets.fromLTRB(27.h, 13.v, 27.h, 10.v))
    ],
  );
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
