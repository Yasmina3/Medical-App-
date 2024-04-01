import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_pin_code_text_field.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/reset_password_verify_code_controller.dart';

class ResetPasswordVerifyCodeScreen
    extends GetWidget<ResetPasswordVerifyCodeController> {
  const ResetPasswordVerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 7.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 37.h),
                          child: Text("lbl29".tr,
                              style:
                                  CustomTextStyles.headlineSmallInterGray900))),
                  SizedBox(height: 8.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: 287.h,
                          margin: EdgeInsets.only(left: 11.h, right: 30.h),
                          child: Text("msg22".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodyLargeAcme
                                  .copyWith(height: 1.50)))),
                  SizedBox(height: 58.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Obx(() => CustomPinCodeTextField(
                          context: Get.context!,
                          controller: controller.otpController.value,
                          onChanged: (value) {}))),
                  SizedBox(height: 40.v),
                  CustomElevatedButton(
                      text: "lbl30".tr,
                      onPressed: () {
                        onTaptf();
                      }),
                  SizedBox(height: 22.v),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "lbl31".tr,
                            style: CustomTextStyles.bodyLargeff707684),
                        TextSpan(
                            text: "lbl32".tr,
                            style: CustomTextStyles.bodyLargeff1d24ca17)
                      ]),
                      textAlign: TextAlign.left),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(height: 52.v, actions: [
      AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.symmetric(horizontal: 27.h, vertical: 14.v))
    ]);
  }

  /// Navigates to the createNewPasswordScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.createNewPasswordScreen,
    );
  }
}
