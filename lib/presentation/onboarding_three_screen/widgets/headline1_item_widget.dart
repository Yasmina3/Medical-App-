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
            SizedBox(height: 15.h),
            Row(
              children: [
                Spacer(),
                Text(
                  "lbl3".tr,
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
