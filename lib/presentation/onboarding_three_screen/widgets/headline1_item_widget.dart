import '../models/headline1_item_model.dart';
import '../controller/onboarding_three_controller.dart';
import 'package:tabibak/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

// ignore: must_be_immutable
class Headline1ItemWidget extends StatelessWidget {
  Headline1ItemWidget(
    this.headline1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Headline1ItemModel headline1ItemModelObj;

  var controller = Get.find<OnboardingThreeController>();

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
            SizedBox(height: 47.v),
            Padding(
              padding: EdgeInsets.only(left: 72.h),
              child: Text(
                "lbl3".tr,
                style: theme.textTheme.titleLarge,
              ),
            ),
            SizedBox(height: 67.v),
            CustomIconButton(
              height: 56.adaptSize,
              width: 56.adaptSize,
              padding: EdgeInsets.all(15.h),
              decoration: IconButtonStyleHelper.outlineBlack,
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
