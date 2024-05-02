import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/reset_password_verify_code_controller.dart';
import 'api.dart';

class ResetPasswordVerifyCodeScreen extends GetWidget<ResetPasswordVerifyCodeController> {
  const ResetPasswordVerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments as String;
    TextEditingController otpController = TextEditingController();

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
                  child: TextField( // Replace CustomPinCodeTextField with TextField
                    controller: otpController, // Use the newly created controller
                    onChanged: (value) {},
                    keyboardType: TextInputType.number, // Set keyboard type if needed
                    decoration: InputDecoration(
                      hintText: "Enter OTP", // Add a hint text
                    ),
                  ),
                ),
                SizedBox(height: 40.v),
                ElevatedButton(
                  onPressed: () {
                    onTaptf(email, otpController.text); // Pass the controller's text to the function
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple, // Set button background color to purple
                    shape: RoundedRectangleBorder( // Apply rounded corners to the button
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.v), // Add padding to match previous button height
                    child: Center(
                      child: Text(
                        "lbl30".tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Adjust font size to match previous button text size
                        ),
                      ),
                    ),
                  ),
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

  void onTaptf(String email, String otp) async {
    if (email.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Email is missing',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
      return;
    }

    try {
      final response = await verifyOtp(email, otp);

      if (response['success'] == true || response['success'] == 'True') {
        Get.toNamed(AppRoutes.createNewPasswordScreen, arguments: email);
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
