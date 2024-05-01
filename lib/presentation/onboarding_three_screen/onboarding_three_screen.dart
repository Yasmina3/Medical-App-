import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/headline1_item_widget.dart';
import 'models/headline1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/onboarding_three_controller.dart';
import 'package:tabibak/presentation/onboarding_three1_screen/onboarding_three1_screen.dart';

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
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.v),
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
                            width: double.maxFinite,
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgPortraitHansom,
                                  height: 900.v,
                                  alignment: Alignment.center,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingThree1Screen()),
                        );
                      },
                      child: Text(
                        "lbl_skip".tr,
                        style: CustomTextStyles.bodyMedium14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
        width: 300.h,
        height: 226.v,
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
          ],
        ),
      ),
    );
  }
}
