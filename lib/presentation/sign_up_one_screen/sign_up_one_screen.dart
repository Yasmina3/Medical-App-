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


  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  RxBool equal = true.obs; // Define as an observable RxBool
  RxBool valid_password = true.obs;

  RxBool valid_email = true.obs;

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
                              _buildInput1(),
                              SizedBox(height: 16.v),
                              _buildInput21(),
                              SizedBox(height: 16.v),
                              _buildInput22(),
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

  /// Section Widget
  Widget _buildInput1() {
    return Obx(() => Column(
      children: [
        CustomTextFormField(
          controller: _emailController,
          hintText: "msg3".tr,
          hintStyle: CustomTextStyles.bodyLarge16,
          suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 10.v, 21.h, 22.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgCheckmark,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          contentPadding: EdgeInsets.only(left: 30.h, top: 13.v, bottom: 13.v),
        ),
        if (!valid_email.value)
          Container(
            height: 18.adaptSize,
            child: Text(
              "ادخل بريد إلكتروني صالح",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
      ],
    ));
  }

  Widget _buildInput21() {
    return Obx(() => Column(
      children: [

        CustomTextFormField(
            controller: _passwordController,
            hintText: "ادخل كلمة السر الخاصة بك".tr,
            hintStyle: CustomTextStyles.bodyLarge16,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            prefix: Container(
                margin: EdgeInsets.fromLTRB(24.h, 18.v, 26.h, 14.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgLocation,
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
                        imagePath: ImageConstant.imgEye,
                        height: 24.adaptSize,
                        width: 24.adaptSize))),
            suffixConstraints: BoxConstraints(maxHeight: 56.v),
            validator: (value) {
              if (value == null || (!isValidPassword(value, isRequired: true))) {


                print("err_msg_please_enter_valid_password".tr);
              }
              valid_password.update((val) { });
              return null;
            },
            obscureText: controller.isShowPassword.value,
            contentPadding: EdgeInsets.symmetric(vertical: 18.v)),
        Container(
            height: 17.v,
            child : !valid_password.value ? Text(
                "أدخل كلمة مرور صالحة " ,
                style : TextStyle(
                  color: Colors.red,
                )
            ) :
            SizedBox(),
            
        ),
      ],
    ));
  }

  /// Section Widget
  Widget _buildInput22() {
    return Obx(() => CustomTextFormField(
        controller: _confirmPasswordController,
        hintText: "اكد كلمة السر الخاصة بك".tr,
        hintStyle: CustomTextStyles.bodyLarge16,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 18.v, 26.h, 14.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
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
                    imagePath: ImageConstant.imgEye,
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
    return Column(
      children: [
        Obx(() {
          return !equal.value ? Container(
            height: 20.adaptSize,
            child: Text(
              "كلمة المرور غير مطابقة لتأكيد كلمة المرور",
              style: TextStyle(
                fontSize: 12.adaptSize,
                color: Colors.red,
              ),
            ),
          ) : SizedBox(); // Hide the error message when equal is true
        }),
        Padding(
          padding: EdgeInsets.only(top: equal.value ? 14.v : 0),
          child: CustomElevatedButton(
            text: "تسجيل".tr,
            buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryBold,
            onPressed: () async {
              UserController Ucnt = Get.find<UserController>();
              String password = _passwordController.text;
              String confirm_password = _confirmPasswordController.text;
              String email =_emailController.text;
              if(!isValidEmail(email,isRequired: true)){
                valid_email.value = false;
                valid_email.update((val) { });
              }
              else if(!isValidPassword(password,isRequired: true)){
                valid_email.value = true;

                valid_password.value = false;
                valid_password.update((val) { });

              }
              else if (password != confirm_password) {
                valid_email.value = true;
                valid_password.value = true;
                equal.value = false; // Update equal value
                equal.update((val) { });
                return;
              } else {
                valid_password.value = true;
                equal.value = true; // Reset equal to true if passwords match
                Ucnt.email.value = _emailController.text;
                Ucnt.password.value = _passwordController.text;

                Get.toNamed(AppRoutes.chooseAgeScreen);
                // Perform signup
              }
            },
          ),
        ),
      ],
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