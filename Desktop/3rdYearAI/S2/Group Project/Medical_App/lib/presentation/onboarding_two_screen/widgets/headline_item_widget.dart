import '../models/headline_item_model.dart';
import '../controller/onboarding_two_controller.dart';
import 'package:tabibak/widgets/custom_icon_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

// ignore: must_be_immutable
class HeadlineItemWidget extends StatelessWidget {
  HeadlineItemWidget(
    this.headlineItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HeadlineItemModel headlineItemModelObj;

  var controller = Get.find<OnboardingTwoController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
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
                    decoration: IconButtonStyleHelper.outlineBlack,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowDown,
                    ),
                  ),
                  Container(
                    height: 4.v,
                    margin: EdgeInsets.symmetric(vertical: 26.v),
                    child: AnimatedSmoothIndicator(
                      activeIndex: 0,
                      count: 2,
                      effect: ScrollingDotsEffect(
                        activeDotColor: Color(0X1212121D),
                        dotHeight: 4.v,
                      ),
                    ),
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
