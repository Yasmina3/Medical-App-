
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/choose_gender_age_controller.dart';


class ChooseGenderAgeScreen extends StatefulWidget {
  const ChooseGenderAgeScreen({Key? key}) : super(key: key);

  @override
  _ChooseGenderAgeScreenState createState() => _ChooseGenderAgeScreenState();
}

class _ChooseGenderAgeScreenState extends State<ChooseGenderAgeScreen> {
  int _selectedOption = 0; // 0 for none, 1 for the first option, 2 for the second option

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 13.v),
            child: Column(
              children: [
                AnotherStepper(
                  stepperDirection: Axis.horizontal,
                  activeIndex: 1,
                  barThickness: 5,
                  inverted: true,
                  stepperList: [
                    StepperData(),
                    StepperData(),
                    StepperData(),
                    StepperData(),
                    StepperData(),
                  ],
                ),
                SizedBox(height: 45.v),
                Text("lbl17".tr, style: theme.textTheme.headlineLarge),
                SizedBox(height: 40.v),
                _buildGenderOptions(),
                SizedBox(height: 65.v),
                Text("lbl20".tr, style: theme.textTheme.headlineLarge),
                // ... Your other widgets here
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildTf(),
      ),
    );
  }

  Widget _buildGenderOptions() {
    // Replace with your actual colors and labels
    return Padding(
      padding: EdgeInsets.only(left: 27.h, right: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildGenderOption(1, "lbl18".tr, appTheme.indigo900), // Placeholder label and color
          _buildGenderOption(2, "lbl19".tr, theme.colorScheme.errorContainer), // Placeholder label and color
        ],
      ),
    );
  }

  Widget _buildGenderOption(int id, String label, Color color) {
    bool isSelected = _selectedOption == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedOption = id),
      child: Container(
        height: 93.v,
        width: 105.h,
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.5) : color,
          borderRadius: BorderRadius.circular(52.h),
          border: isSelected ? Border.all(color: Color.fromARGB(255, 44, 31, 161), width: 4) : null,
        ),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 23.v),
          child: Text(label, style: CustomTextStyles.headlineLargeOnPrimary),
        ),
      ),
    );
  }
  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 70.0,
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
