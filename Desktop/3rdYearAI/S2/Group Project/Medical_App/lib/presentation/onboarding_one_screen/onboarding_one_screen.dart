import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/onboarding_one_controller.dart';

// ignore_for_file: must_be_immutable
class OnboardingOneScreen extends GetWidget<OnboardingOneController> {
  const OnboardingOneScreen({Key? key})
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
                  padding: EdgeInsets.symmetric(vertical: 27.v),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImageConstant.imgGroup16,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildAppBar(),
                      Spacer(),
                      Text(
                        "lbl2".tr,
                        style: CustomTextStyles.headlineSmallInterGray900,
                      ),
                      SizedBox(height: 71.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 4.v,
                          margin: EdgeInsets.only(right: 51.h),
                          child: AnimatedSmoothIndicator(
                            activeIndex: 0,
                            count: 3,
                            effect: ScrollingDotsEffect(
                              spacing: 3,
                              activeDotColor: theme.colorScheme.primary,
                              dotColor:
                                  theme.colorScheme.primary.withOpacity(0.46),
                              dotHeight: 4.v,
                              dotWidth: 12.h,
                            ),
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
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 17.v,
      actions: [
        AppbarSubtitleFive(
          text: "lbl_skip".tr,
          margin: EdgeInsets.symmetric(horizontal: 26.h),
        ),
      ],
    );
  }
}
