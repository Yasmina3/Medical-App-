import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_pin_code_text_field.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/reset_password_verify_code_controller.dart';
import 'api.dart';  // Import your api.dart file

class ResetPasswordVerifyCodeScreen extends GetWidget<ResetPasswordVerifyCodeController> {
  const ResetPasswordVerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments as String;  // Retrieve email from arguments

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 7.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl29".tr,
                  style: CustomTextStyles.headlineSmallInterGray900,
                ),
                SizedBox(height: 8.v),
                Text(
                  "msg22".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyLargeAcme.copyWith(height: 1.50),
                ),
                SizedBox(height: 58.v),
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: CustomPinCodeTextField(
                    context: Get.context!,
                    controller: controller.otpController.value,
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 40.v),
                CustomElevatedButton(
                  text: "lbl30".tr,
                  onPressed: () {
                    verifyOtp(email, controller.otpController.value.text);  // Pass email and OTP
                  },
                ),
                SizedBox(height: 22.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl31".tr,
                        style: CustomTextStyles.bodyLargeff707684,
                      ),
                      TextSpan(
                        text: "lbl32".tr,
                        style: CustomTextStyles.bodyLargeff1d24ca17,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 52.v,
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.symmetric(horizontal: 27.h, vertical: 14.v),
        ),
      ],
    );
  }

  void onTaptf() async {
    final email = Get.arguments as String?;

    if (email == null || email.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Email is missing',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
      return;
    }

    final otp = controller.otpController.value.text;

    try {
      final response = await verifyOtp(email, otp);

      if (response['success']) {
        Get.toNamed(AppRoutes.createNewPasswordScreen);
      } else {
        Fluttertoast.showToast(
          msg: response['message'] ?? 'Invalid OTP',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'An error occurred while verifying OTP',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    }
  }

}
