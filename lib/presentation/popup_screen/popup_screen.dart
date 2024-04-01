import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/popup_controller.dart';

// ignore_for_file: must_be_immutable
class PopupScreen extends GetWidget<PopupController> {
  const PopupScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 327.h,
          padding: EdgeInsets.symmetric(
            horizontal: 41.h,
            vertical: 13.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 43.v),
              Container(
                height: 103.adaptSize,
                width: 103.adaptSize,
                padding: EdgeInsets.symmetric(
                  horizontal: 29.h,
                  vertical: 34.v,
                ),
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder51,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgCheckmarkPrimary,
                  height: 32.v,
                  radius: BorderRadius.circular(
                    3.h,
                  ),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 44.v),
              Text(
                "lbl34".tr,
                style: CustomTextStyles.titleLarge20,
              ),
              SizedBox(height: 6.v),
              SizedBox(
                width: 243.h,
                child: Text(
                  "msg27".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildTf(),
      ),
    );
  }

  /// Section Widget
  Widget _buildTf() {
    return CustomElevatedButton(
      width: 183.h,
      text: "lbl5".tr,
      margin: EdgeInsets.only(
        left: 72.h,
        right: 72.h,
        bottom: 40.v,
      ),
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary_1,
    );
  }
}
