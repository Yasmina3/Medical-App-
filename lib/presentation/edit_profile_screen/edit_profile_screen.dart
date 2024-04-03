import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:tabibak/widgets/custom_text_form_field.dart';
import 'package:tabibak/core/utils/validation_functions.dart';
import 'package:tabibak/widgets/custom_checkbox_button.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/edit_profile_controller.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends GetWidget<EditProfileController> {
  EditProfileScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.h, vertical: 22.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      height: 80.adaptSize,
                                      width: 80.adaptSize,
                                      margin: EdgeInsets.only(left: 123.h),
                                      child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgEllipse2780x80,
                                                height: 80.adaptSize,
                                                width: 80.adaptSize,
                                                radius:
                                                BorderRadius.circular(40.h),
                                                alignment: Alignment.center),
                                            Align(
                                                alignment:
                                                Alignment.bottomRight,
                                                child: Container(
                                                    height: 16.adaptSize,
                                                    width: 16.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        right: 4.h,
                                                        bottom: 5.v),
                                                    padding:
                                                    EdgeInsets.all(3.h),
                                                    decoration: AppDecoration
                                                        .fillOnPrimary
                                                        .copyWith(
                                                        borderRadius:
                                                        BorderRadiusStyle
                                                            .circleBorder6),
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgCamera,
                                                        height: 10.adaptSize,
                                                        width: 10.adaptSize,
                                                        alignment:
                                                        Alignment.center)))
                                          ]))),
                              SizedBox(height: 21.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 119.h),
                                      child: Text("lbl62".tr,
                                          style: CustomTextStyles
                                              .titleMediumOnErrorContainer))),
                              SizedBox(height: 30.v),
                              _buildInput(),
                              SizedBox(height: 16.v),
                              _buildEmail(),
                              SizedBox(height: 16.v),
                              _buildInput1(),
                              SizedBox(height: 16.v),
                              _buildTermsofServicePrivacyAgreement(),
                              SizedBox(height: 40.v),
                              _buildTf(),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray900,
            margin: EdgeInsets.only(left: 32.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarSubtitleTwo(text: "msg42".tr));
  }

  /// Section Widget
  Widget _buildInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: CustomTextFormField(
        controller: controller.inputController,
        hintText: "أدخل اسمك الشخصي", // Set the hint text in Arabic
        obscureText: false, // Allow deleting text when typing
        suffix: GestureDetector(
          onTap: () {
            // Clear the text field when the suffix is tapped
            controller.inputController.clear();
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(17.h, 10.v, 30.h, 22.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgSettingsPrimary,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
        ),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
      ),
    );
  }


  /// Section Widget
  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: CustomTextFormField(
        controller: controller.emailController,
        hintText: "أدخل بريدك الإلكتروني", // Set the hint text in Arabic
        textInputType: TextInputType.emailAddress,
        obscureText: false, // Allow deleting text when typing
        suffix: Container(
          margin: EdgeInsets.fromLTRB(16.h, 16.v, 30.h, 16.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgSms,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "الرجاء إدخال بريد إلكتروني صالح"; // Display error message in Arabic
          }
          return null;
        },
      ),
    );
  }


  /// Section Widget
  Widget _buildInput1() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Obx(() => CustomTextFormField(
        controller: controller.inputController1,
        hintText: "ادخل كلمة المرور",
        textInputAction: TextInputAction.done,
        prefix: GestureDetector(
          onTap: () {
            controller.isShowPassword.value = !controller.isShowPassword.value;
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18.h, vertical: 13.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconEyeSlash, // Keep it consistent
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
        ),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        suffix: InkWell(
          onTap: () {
            controller.isShowPassword.value = !controller.isShowPassword.value;
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 26.h, vertical: 13.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconPassword,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
        ),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        obscureText: !controller.isShowPassword.value,
      )),
    );
  }


  /// Section Widget
  Widget _buildTermsofServicePrivacyAgreement() {
    return Padding(
        padding: EdgeInsets.only(left: 10.h),
        child: Obx(() => CustomCheckboxButton(
            text: "msg43".tr,
            value: controller.termsofServicePrivacyAgreement.value,
            padding: EdgeInsets.symmetric(vertical: 2.v),
            onChange: (value) {
              controller.termsofServicePrivacyAgreement.value = value;
            })));
  }

  /// Section Widget
  Widget _buildTf() {
    return CustomElevatedButton(
        text: "lbl64".tr,
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        buttonTextStyle: CustomTextStyles.titleMediumOnPrimary_1,
        onPressed: () {
          onTaptf();
        });
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapArrowLeft() {
    Get.toNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.profileScreen,
    );
  }
}
