import 'package:tabibak/core/utils/validation_functions.dart';
import 'package:tabibak/widgets/custom_text_form_field.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/reset_password_email_controller.dart';
import 'models/reset_password_email_model.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordEmailPage extends StatelessWidget {
  ResetPasswordEmailPage({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ResetPasswordEmailController controller =
      Get.put(ResetPasswordEmailController(ResetPasswordEmailModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            decoration: AppDecoration.fillOnPrimary,
                            child: Column(children: [
                              SizedBox(height: 24.v),
                              _buildEmail()
                            ])))))));
  }

  /// Section Widget
  Widget _buildEmail() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(children: [
          CustomTextFormField(
              controller: controller.emailController,
              hintText: "msg_jamesschleifer_gmail_com".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgSms,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              }),
          SizedBox(height: 32.v),
          CustomElevatedButton(
              text: "msg18".tr,
              onPressed: () {
                onTaptf();
              })
        ]));
  }

  /// Navigates to the resetPasswordVerifyCodeScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.resetPasswordVerifyCodeScreen,
    );
  }
}
