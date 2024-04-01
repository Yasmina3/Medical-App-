import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_text_form_field.dart';
import 'package:tabibak/core/utils/validation_functions.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:tabibak/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/login_controller.dart';
import 'package:tabibak/presentation/login_success_dialog/login_success_dialog.dart';
import 'package:tabibak/presentation/login_success_dialog/controller/login_success_controller.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

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
                                horizontal: 24.h, vertical: 30.v),
                            child: Column(children: [
                              _buildInput(),
                              SizedBox(height: 16.v),
                              _buildEye(),
                              SizedBox(height: 11.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtWidget();
                                      },
                                      child: Text("msg5".tr,
                                          style: CustomTextStyles
                                              .titleMediumPrimary))),
                              SizedBox(height: 28.v),
                              _buildTf(),
                              SizedBox(height: 28.v),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxttf();
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "lbl7".tr,
                                            style: CustomTextStyles
                                                .bodyLargeff707684),
                                        TextSpan(
                                            text: "lbl8".tr,
                                            style: CustomTextStyles
                                                .bodyLargeff1d24ca)
                                      ]),
                                      textAlign: TextAlign.left)),
                              SizedBox(height: 23.v),
                              _buildEleven(),
                              SizedBox(height: 24.v),
                              _buildGoogle(),
                              SizedBox(height: 16.v),
                              _buildApple(),
                              SizedBox(height: 16.v),
                              _buildFacebook(),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 49.v,
        centerTitle: true,
        title: AppbarSubtitleTwo(text: "lbl5".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgArrowRight,
              margin: EdgeInsets.fromLTRB(20.h, 12.v, 20.h, 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildInput() {
    return CustomTextFormField(
        controller: controller.inputController,
        hintText: "msg3".tr,
        hintStyle: theme.textTheme.bodyLarge!,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(23.h, 16.v, 15.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(left: 30.h, top: 11.v, bottom: 11.v));
  }

  /// Section Widget
  Widget _buildEye() {
    return Obx(() => CustomTextFormField(
        controller: controller.eyeController,
        hintText: "msg4".tr,
        hintStyle: theme.textTheme.bodyLarge!,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(17.h, 18.v, 23.h, 14.v),
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
                margin: EdgeInsets.fromLTRB(23.h, 12.v, 13.h, 20.v),
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
        contentPadding: EdgeInsets.symmetric(vertical: 17.v)));
  }

  /// Section Widget
  Widget _buildTf() {
    return CustomElevatedButton(
        text: "lbl5".tr,
        buttonTextStyle: CustomTextStyles.titleMediumOnPrimary_1,
        onPressed: () {
          onTaptf();
        });
  }

  /// Section Widget
  Widget _buildTf1() {
    return CustomElevatedButton(
        height: 31.v,
        width: 53.h,
        text: "lbl9".tr,
        buttonStyle: CustomButtonStyles.fillOnPrimary,
        buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer,
        alignment: Alignment.center);
  }

  /// Section Widget
  Widget _buildEleven() {
    return SizedBox(
        height: 31.v,
        width: 327.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 14.v),
                  child: SizedBox(
                      width: 327.h, child: Divider(color: appTheme.gray200)))),
          _buildTf1()
        ]));
  }

  /// Section Widget
  Widget _buildGoogle() {
    return CustomOutlinedButton(
        text: "msg7".tr,
        rightIcon: Container(
            margin: EdgeInsets.only(left: 21.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgGoogle, width: 19.h)));
  }

  /// Section Widget
  Widget _buildApple() {
    return CustomOutlinedButton(
        text: "msg8".tr,
        rightIcon: Container(
            margin: EdgeInsets.only(left: 26.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgApple, width: 16.h)));
  }

  /// Section Widget
  Widget _buildFacebook() {
    return CustomOutlinedButton(text: "msg9".tr);
  }

  /// Navigates to the resetPasswordEmailTabContainerScreen when the action is triggered.
  onTapTxtWidget() {
    Get.toNamed(
      AppRoutes.resetPasswordEmailTabContainerScreen,
    );
  }

  /// Displays a dialog with the [LoginSuccessDialog] content.
  onTaptf() {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 0),
      content: LoginSuccessDialog(
        Get.put(
          LoginSuccessController(),
        ),
      ),
    ));
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxttf() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
