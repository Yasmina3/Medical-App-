import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:tabibak/widgets/custom_text_form_field.dart';
import 'controller/create_new_password_controller.dart';
import 'api.dart';

class CreateNewPasswordScreen extends GetWidget<CreateNewPasswordController> {
  CreateNewPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments as String;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 26.v),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 14.h),
                        child: Text(
                          "msg24".tr,
                          style: CustomTextStyles.headlineSmallInterGray900,
                        ),
                      ),
                    ),
                    SizedBox(height: 26.v),
                    Text(
                      "msg25".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 23.v),
                    Obx(() => CustomTextFormField(
                      controller: controller.inputController,
                      prefix: Container(
                        margin: EdgeInsets.symmetric(horizontal: 26.h, vertical: 12.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgIconEyeSlash,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(maxHeight: 56.v),
                      suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword.value = !controller.isShowPassword.value;
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 23.h, vertical: 14.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgIconPassword,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(maxHeight: 56.v),
                      obscureText: controller.isShowPassword.value,
                    )),
                    SizedBox(height: 16.v),
                    Obx(() => CustomTextFormField(
                      controller: controller.inputController1,
                      hintText: "msg26".tr,
                      hintStyle: theme.textTheme.bodyLarge!,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(21.h, 16.v, 30.h, 16.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgEye,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(maxHeight: 56.v),
                      suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword1.value = !controller.isShowPassword1.value;
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(18.h, 10.v, 21.h, 22.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgLocation,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(maxHeight: 56.v),
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_password".tr;
                        }
                        return null;
                      },
                      obscureText: controller.isShowPassword1.value,
                      contentPadding: EdgeInsets.symmetric(vertical: 17.v),
                    )),
                    SizedBox(height: 24.v),
                    CustomElevatedButton(
                      text: "lbl33".tr,
                      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary_1,
                      onPressed: () {
                        onTaptf(email);
                      },
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 40.v,
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.symmetric(horizontal: 15.h),
        ),
      ],
    );
  }

  void onTaptf(String email) async {
    if (_formKey.currentState!.validate()) {
      final newPassword = controller.inputController1.text;
      try {
        await updatePassword(email, newPassword);
        Get.toNamed(AppRoutes.popupScreen);
      } catch (e) {
        print('Error updating password: $e');
      }
    }
  }
  bool isValidPassword(String password, {bool isRequired = false}) {
    // Password is required
    if (isRequired && (password == null || password.isEmpty)) {
      return false;
    }
    if (password.length < 8) {
      return false;
    }
    return true;
  }
}
