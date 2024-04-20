import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_text_form_field.dart';
import 'package:tabibak/core/utils/validation_functions.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/sign_up_one_controller.dart';
import 'package:tabibak/presentation/sign_up_success_dialog/sign_up_success_dialog.dart';
import 'package:tabibak/presentation/sign_up_success_dialog/controller/sign_up_success_controller.dart';
import 'package:tabibak/presentation/UserController.dart';

// ignore_for_file: must_be_immutable
class SignUpOneScreen extends GetWidget<SignUpOneController> {
  SignUpOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
                                horizontal: 24.h, vertical: 30.v),
                            child: Column(children: [
                              _buildInput(),
                              SizedBox(height: 16.v),
                              _buildInput1(),
                              SizedBox(height: 16.v),
                              _buildInput2(),
                              SizedBox(height: 88.v),
                              _buildTf(context),
                              SizedBox(height: 27.v),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtWidget();
                                  },
                                  child: Text("msg12".tr,
                                      style:
                                      CustomTextStyles.bodyMediumGray600)),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 49.v,
        centerTitle: true,
        title: AppbarSubtitleTwo(text: "lbl6".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgArrowRight,
              margin: EdgeInsets.fromLTRB(25.h, 12.v, 25.h, 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildInput() {
    return CustomTextFormField(
        controller: _emailController,
        hintText: "lbl13".tr,
        hintStyle: CustomTextStyles.bodyLarge16,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 16.v, 21.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v));
  }

  /// Section Widget
  Widget _buildInput1() {
    return CustomTextFormField(
        controller: _passwordController,
        hintText: "msg3".tr,
        hintStyle: CustomTextStyles.bodyLarge16,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 10.v, 21.h, 22.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(left: 30.h, top: 13.v, bottom: 13.v));
  }

  /// Section Widget
  Widget _buildInput2() {
    return Obx(() => CustomTextFormField(
        controller: _confirmPasswordController,
        hintText: "msg4".tr,
        hintStyle: CustomTextStyles.bodyLarge16,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 18.v, 26.h, 14.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgEye,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        suffix: InkWell(
            onTap: () {
              controller.isShowPassword.value =
              !controller.isShowPassword.value;
            },
            child: Container(
                margin: EdgeInsets.fromLTRB(26.h, 16.v, 23.h, 16.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgLocation,
                    height: 24.adaptSize,
                    width: 24.adaptSize))),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: controller.isShowPassword.value,
        contentPadding: EdgeInsets.symmetric(vertical: 18.v)));
  }

  Widget _buildTf(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl6".tr,
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryBold,
      onPressed: () async {
        UserController Ucnt = Get.find<UserController>();
        Ucnt.email.value = _emailController.text;
        Ucnt.password.value = _passwordController.text;

        Get.toNamed(AppRoutes.chooseAgeScreen);
        // Perform signup
        /*
        bool success = await signUp(
          _emailController.text,
          _passwordController.text,
          _confirmPasswordController.text,
        );

        // Check if signup was successful
        if (success) {
          // Navigate to chooseAgeScreen route
          Get.toNamed(AppRoutes.chooseAgeScreen);
        } else {
          // Handle signup failure
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Signup failed. Please try again.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
        */
      },
    );
  }



  /// Displays a dialog with the [SignUpSuccessDialog] content.
  onTaptf() {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 0),
      content: SignUpSuccessDialog(
        Get.put(
          SignUpSuccessController(),
        ),
      ),
    ));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtWidget() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}