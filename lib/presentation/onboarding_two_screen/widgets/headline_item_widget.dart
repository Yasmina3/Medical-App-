import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package for navigation

import '../models/headline_item_model.dart';
import '../controller/onboarding_two_controller.dart';
import 'package:tabibak/widgets/custom_icon_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
          horizontal: 10.h,
          vertical: 14.v,
        ),
        decoration: AppDecoration.gradientGrayToGray.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Row(
              children: [
                Spacer(),
                Text(
                  "msg".tr,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(width: 10.v)
              ],
            ),
            SizedBox(height: 65.v),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CustomIconButton(
                  height: 56.adaptSize,
                  width: 56.adaptSize,
                  padding: EdgeInsets.all(15.h),
                  decoration: IconButtonStyleHelper.outlineBlack,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowDown,
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 18.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  SizedBox(width: 3.0),
                  Container(
                    width: 18.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  SizedBox(width: 3.0),
                  Container(
                    width: 18.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10.h,
              )
            ]),
          ],
        ),
      ),
    );
  }
}
