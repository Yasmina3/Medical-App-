import 'package:mohamed_nadir_student_s_application5/widgets/custom_icon_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mohamed_nadir_student_s_application5/core/app_export.dart';
import 'controller/onboarding_two_controller.dart';

// ignore_for_file: must_be_immutable
class OnboardingTwoScreen extends GetWidget<OnboardingTwoController> {
  const OnboardingTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 768.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "lbl_skip".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      SizedBox(
                        height: 685.v,
                        width: 325.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.img7xm5,
                              width: 321.h,
                              alignment: Alignment.topCenter,
                            ),
                            _buildSix(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 768.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 226.v,
                          width: 321.h,
                          margin: EdgeInsets.only(bottom: 36.v),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24.h),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment(0.5, 0),
                              end: Alignment(0.5, 1),
                              colors: [
                                appTheme.gray50,
                                appTheme.gray50.withOpacity(0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 26.h,
                            vertical: 27.v,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageConstant.imgGroup7,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "lbl_skip".tr,
                                style: theme.textTheme.bodyMedium,
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "lbl".tr,
                                  style: theme.textTheme.headlineSmall,
                                ),
                              ),
                              SizedBox(height: 71.v),
                              Container(
                                height: 4.v,
                                margin: EdgeInsets.only(right: 25.h),
                                child: AnimatedSmoothIndicator(
                                  activeIndex: 0,
                                  count: 3,
                                  effect: ScrollingDotsEffect(
                                    spacing: 3,
                                    activeDotColor: appTheme.indigo700,
                                    dotColor:
                                        appTheme.indigo700.withOpacity(0.46),
                                    dotHeight: 4.v,
                                    dotWidth: 12.h,
                                  ),
                                ),
                              ),
                              SizedBox(height: 61.v),
                            ],
                          ),
                        ),
                      ),
                    ],
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
  Widget _buildSix() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(left: 4.h),
        padding: EdgeInsets.symmetric(
          horizontal: 9.h,
          vertical: 22.v,
        ),
        decoration: AppDecoration.gradientGrayToGray.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 41.v),
            Container(
              width: 215.h,
              margin: EdgeInsets.only(left: 33.h),
              child: Text(
                "msg".tr,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge!.copyWith(
                  height: 1.35,
                ),
              ),
            ),
            SizedBox(height: 45.v),
            Padding(
              padding: EdgeInsets.only(right: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    height: 56.adaptSize,
                    width: 56.adaptSize,
                    padding: EdgeInsets.all(15.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowDown,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgSlider,
                    height: 4.v,
                    margin: EdgeInsets.symmetric(vertical: 26.v),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
