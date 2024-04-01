import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/headline_item_widget.dart';
import 'models/headline_item_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
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
        appBar: _buildAppBar(),
        body: Container(
          height: 704.v,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 22.h),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.img7xm5,
                width: 321.h,
                alignment: Alignment.topLeft,
              ),
              _buildHeadline(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      actions: [
        AppbarSubtitleFive(
          text: "lbl_skip".tr,
          margin: EdgeInsets.symmetric(
            horizontal: 22.h,
            vertical: 19.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildHeadline() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 226.v,
        width: 321.h,
        margin: EdgeInsets.only(bottom: 5.v),
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
                itemCount: controller
                    .onboardingTwoModelObj.value.headlineItemList.value.length,
                itemBuilder: (context, index, realIndex) {
                  HeadlineItemModel model = controller.onboardingTwoModelObj
                      .value.headlineItemList.value[index];
                  return HeadlineItemWidget(
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
                    right: 14.h,
                    bottom: 48.v,
                  ),
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.sliderIndex.value,
                    count: controller.onboardingTwoModelObj.value
                        .headlineItemList.value.length,
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
