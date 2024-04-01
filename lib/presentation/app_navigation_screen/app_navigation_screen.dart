import '../login_success_dialog/login_success_dialog.dart';
import '../login_success_dialog/controller/login_success_controller.dart';
import '../sign_up_success_dialog/sign_up_success_dialog.dart';
import '../sign_up_success_dialog/controller/sign_up_success_controller.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/app_navigation_controller.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "1_Splash Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2_Onboarding One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "3_Onboarding Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "4_Onboarding Three".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingThreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "5_Onboarding Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboardingThree1Screen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "6_Login".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "9_Login - Success - Dialog".tr,
                          onTapScreenTitle: () => onTapDialogTitle(
                              context,
                              LoginSuccessDialog(
                                LoginSuccessController(),
                              )),
                        ),
                        _buildScreenTitle(
                          screenTitle: "10_Sign Up".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "10_Sign Up One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signUpOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "13_Sign Up - Success - Dialog".tr,
                          onTapScreenTitle: () => onTapDialogTitle(
                              context,
                              SignUpSuccessDialog(
                                SignUpSuccessController(),
                              )),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Choose Age".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.chooseAgeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Choose gender/age".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.chooseGenderAgeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Choose height/weight".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.chooseHeightWeightScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: " special questions".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.specialQuestionsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Done".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.doneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "14_Reset Password - Email - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.resetPasswordEmailTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "16_Reset Password - Verify Code".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.resetPasswordVerifyCodeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "17_Create New Password".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createNewPasswordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "popup".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.popupScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "19_Home".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "20_Top Doctor".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.topDoctorScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "25_Chat with bot".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.chatWithBotScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "20_suggestions".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.suggestionsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "35_ Location".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.locationScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "21_Find Doctors".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.findDoctorsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "22_Doctor Detail".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.doctorDetailScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "25_all specialties".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.allSpecialtiesScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "26_all doctors".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.allDoctorsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "36_Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "38_Edit Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common click event for dialog
  void onTapDialogTitle(
    BuildContext context,
    Widget className,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return className;
      },
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
