import 'package:tabibak/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(0.5, 0),
                      end: Alignment(0, 0.47),
                      colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withOpacity(0.51)
                  ])),
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                            height: 254.v,
                            width: 273.h,
                            child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 106.h, bottom: 8.v),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                    height: 114.v,
                                                    width: 124.h,
                                                    child: Stack(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        children: [
                                                          CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgEllipse27,
                                                              height: 114.v,
                                                              radius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          62.h),
                                                              alignment:
                                                                  Alignment
                                                                      .center),
                                                          Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child: Container(
                                                                  height: 22.v,
                                                                  width: 24.h,
                                                                  margin: EdgeInsets.only(
                                                                      right:
                                                                          6.h,
                                                                      bottom:
                                                                          7.v),
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        Align(
                                                                            alignment: Alignment
                                                                                .center,
                                                                            child: Container(
                                                                                height: 22.v,
                                                                                width: 24.h,
                                                                                decoration: BoxDecoration(color: theme.colorScheme.onPrimary.withOpacity(1), borderRadius: BorderRadius.circular(12.h)))),
                                                                        CustomImageView(
                                                                            imagePath:
                                                                                ImageConstant.imgCamera,
                                                                            height: 14.v,
                                                                            alignment: Alignment.center)
                                                                      ])))
                                                        ])),
                                                SizedBox(height: 18.v),
                                                Text("lbl_amelia_renata".tr,
                                                    style: CustomTextStyles
                                                        .headlineSmallInterOnPrimary)
                                              ]))),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgGroup119,
                                      height: 254.v,
                                      alignment: Alignment.centerRight)
                                ]))),
                    SizedBox(height: 54.v),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 17.h, vertical: 26.v),
                        decoration: AppDecoration.fillOnPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL30),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 32.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: _buildInfo(
                                      widget: "msg41".tr,
                                      onTapFAQs: () {
                                        onTapFAQs1();
                                      })),
                              SizedBox(height: 13.v),
                              Divider(indent: 5.h, endIndent: 1.h),
                              SizedBox(height: 13.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 5.h, right: 1.h),
                                  child: _buildPriv(
                                      widget: "lbl60".tr,
                                      onTapFAQs: () {
                                        onTapFAQs1();
                                      })),
                              SizedBox(height: 13.v),
                              Divider(indent: 5.h, endIndent: 1.h),
                              SizedBox(height: 13.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 5.h, right: 1.h),
                                  child: _buildOut(
                                    widget: "lbl61".tr,
                                    onTapFAQs: () {
                                      onTapOut();
                                    }
                                  )),
                              SizedBox(height: 89.v),
                            ]))
                  ]))),
        ),
        bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildBottomBar() {
    return Container(
      margin: EdgeInsets.only(left: 4.h),
      child: Container(
        height: 49.v,
        width: 276.h,
        margin: EdgeInsets.fromLTRB(60.h, 18.v, 60.h, 12.v),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: onTapHome, // Call onTapImgAIEssentialsIcon function
                child: CustomImageView(
                  imagePath: "assets/images/homeGray.png",
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 12.v),
                )),
            Spacer(),
            GestureDetector(
              onTap:
                  onTapImgAIEssentialsIcon, // Call onTapImgAIEssentialsIcon function
              child: CustomImageView(
                imagePath: ImageConstant.imgAvatar,
                height: 49.adaptSize,
                width: 49.adaptSize,
                alignment: Alignment.center,
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: "assets/images/userBlue.png",
              height: 30.adaptSize,
              width: 30.adaptSize,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildInfo({
    required String widget,
    Function? onTapFAQs,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFAQs?.call();
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomImageView(
            imagePath: "assets/images/userIcone.png",
            height: 30.adaptSize,
            width: 30.adaptSize,
          ),
          Padding(
              padding: EdgeInsets.only(left: 17.h, top: 14.v, bottom: 7.v),
              child: Text(widget,
                  style: CustomTextStyles.titleMediumGray900Bold
                      .copyWith(color: appTheme.gray900))),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRightGray700,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(top: 10.v, bottom: 9.v))
        ]));
  }

  /// Common widget
  Widget _buildPriv({
    required String widget,
    Function? onTapFAQs,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFAQs?.call();
        },
        child: Row(children: [
          CustomImageView(
            imagePath: "assets/images/protect.png",
            height: 30.adaptSize,
            width: 30.adaptSize,
          ),
          Padding(
              padding: EdgeInsets.only(left: 17.h, top: 14.v, bottom: 7.v),
              child: Text(widget,
                  style: CustomTextStyles.titleMediumGray900Bold
                      .copyWith(color: appTheme.gray900))),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRightGray700,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(top: 10.v, bottom: 9.v))
        ]));
  }

  /// Common widget
  Widget _buildOut({
    required String widget,
    Function? onTapFAQs,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFAQs?.call();
        },
        child: Row(children: [
          CustomImageView(
            imagePath: "assets/images/logout.png",
            height: 40.adaptSize,
            width: 40.adaptSize,
          ),
          Padding(
              padding: EdgeInsets.only(left: 17.h, top: 14.v, bottom: 7.v),
              child:
                  Text(widget, style: CustomTextStyles.titleMediumRed900Bold)),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRightGray700,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(top: 10.v, bottom: 9.v))
        ]));
  }

  // Navigates to the popup screen when the action is triggered.
  onTapOut() {
    Get.toNamed(
      AppRoutes.popupLogout,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapFAQs1() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }

  /// Navigates to the doctorDetailScreen when the action is triggered.
  onTapImgThumbsUp() {
    Get.toNamed(
      AppRoutes.doctorDetailScreen,
    );
  }

  /// Navigates to the topDoctorScreen when the action is triggered.
  onTapTxtWidget() {
    Get.toNamed(
      AppRoutes.topDoctorScreen,
    );
  }

  /// Navigates to the chatWithBotScreen when the action is triggered.
  onTapImgAIEssentialsIcon() {
    Get.toNamed(
      AppRoutes.chatWithBotScreen,
    );
  }

  onTapHome() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }
}
