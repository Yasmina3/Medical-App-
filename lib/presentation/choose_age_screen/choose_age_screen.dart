import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/choose_age_controller.dart';

class ChooseAgeScreen extends GetWidget<ChooseAgeController> {
  const ChooseAgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView( // Makes the page scrollable
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 13.v),
            child: Column(
              children: [
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
                  ],
                ),
                SizedBox(height: 50.v), // Adjusted spacing
                _buildProfilePictureEdit(),
                SizedBox(height: 72.v),
                Text("msg14".tr, style: theme.textTheme.headlineLarge),
                SizedBox(height: 41.v),
                _buildNameTextField(),
                SizedBox(height: 63.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildTf(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 70.0, // Set the desired height for the app bar
      actions: [
        AppbarTitle(
          text: "lbl".tr,
          margin: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.v)
        )
      ]
    );
  }

  Widget _buildProfilePictureEdit() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 200.v,
          width: 198.h,
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder99,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgChangeImage,
            width: 198.h,
            radius: BorderRadius.circular(99.h),
            alignment: Alignment.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10.v, right: 10.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.6),
          ),
          child: IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Add your edit picture functionality here
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNameTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "lbl_momoh_mdj".tr,
        hintStyle: CustomTextStyles.titleMediumNunitoOnPrimary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        fillColor: Color(0XCE1D24CA),
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.v,
          horizontal: 20.h,
        ),
      ),
      style: CustomTextStyles.titleMediumNunitoOnPrimary,
    );
  }

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
      },
    );
  }

  void onTaptf() {
    Get.toNamed(
      AppRoutes.chooseGenderAgeScreen,
    );
  }
}
