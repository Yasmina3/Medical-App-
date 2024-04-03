import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/popupL_controller.dart';
import 'controller/popup_controller.dart';

// ignore_for_file: must_be_immutable
class PopupLogout extends GetWidget<PopupController> {
  const PopupLogout({Key? key})
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
              SizedBox(height: 160.v),
              Container(
                height: 100.adaptSize,
                width: 100.adaptSize,
                
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder51,
                ),
                child: CustomImageView(
                  imagePath: "assets/images/logout.png",
                  height: 40.adaptSize,
                  width:40.adaptSize,
                  
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 44.v),
              Text(
                "lblOut".tr,
                style: CustomTextStyles.titleLarge20,
              ),
              SizedBox(height: 6.v),
              
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
      text: "lbl5out".tr,
      margin: EdgeInsets.only(
        left: 72.h,
        right: 72.h,
        bottom: 40.v,
      ),
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary_1,
    );
  }
}
