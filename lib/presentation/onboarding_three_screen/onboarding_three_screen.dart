import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/headline1_item_widget.dart';
import 'models/headline1_item_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/onboarding_three_controller.dart';

// ignore_for_file: must_be_immutable
class OnboardingThreeScreen extends GetWidget<OnboardingThreeController> {
  const OnboardingThreeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 768.v,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 26.v),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 708.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 490.v,
                          width: double.maxFinite,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgPortraitHansom,
                                width: 375.h,
                                alignment: Alignment.center,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowDown,
                                height: 11.v,
                                alignment: Alignment.bottomLeft,
                                margin: EdgeInsets.only(
                                  left: 20.h,
                                  bottom: 130.v,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildHeadline(),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 22.h),
                  child: Text(
                    "lbl_skip".tr,
                    style: CustomTextStyles.bodyMedium14,
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
  Widget _buildHeadline() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 226.v,
        width: 321.h,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Obx(
              () => CarouselSlider.builder(
                options: CarouselOptions(
                  height: 226.v,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (
                    index,
                    reason,
                  ) {
                    controller.sliderIndex.value = index;
                  },
                ),
                itemCount: controller.onboardingThreeModelObj.value
                    .headline1ItemList.value.length,
                itemBuilder: (context, index, realIndex) {
                  Headline1ItemModel model = controller.onboardingThreeModelObj
                      .value.headline1ItemList.value[index];
                  return Headline1ItemWidget(
                    model,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Obx(
                () => Container(
                  height: 4.v,
                  margin: EdgeInsets.only(
                    right: 12.h,
                    bottom: 48.v,
                  ),
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.sliderIndex.value,
                    count: controller.onboardingThreeModelObj.value
                        .headline1ItemList.value.length,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      spacing: 3,
                      activeDotColor: theme.colorScheme.primary,
                      dotColor: theme.colorScheme.primary.withOpacity(0.46),
                      dotHeight: 4.v,
                      dotWidth: 12.h,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
