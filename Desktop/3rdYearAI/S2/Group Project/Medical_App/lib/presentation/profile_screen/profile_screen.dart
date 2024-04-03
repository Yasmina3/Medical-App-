import 'package:tabibak/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                padding: EdgeInsets.only(bottom: 79.v),
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
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        62.h),
                                                                alignment:
                                                                    Alignment
                                                                        .center),
                                                            Align(
                                                                alignment: Alignment
                                                                    .bottomRight,
                                                                child:
                                                                    Container(
                                                                        height: 22
                                                                            .v,
                                                                        width: 24
                                                                            .h,
                                                                        margin: EdgeInsets.only(
                                                                            right: 6
                                                                                .h,
                                                                            bottom: 7
                                                                                .v),
                                                                        child: Stack(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            children: [
                                                                              Align(alignment: Alignment.center, child: Container(height: 22.v, width: 24.h, decoration: BoxDecoration(color: theme.colorScheme.onPrimary.withOpacity(1), borderRadius: BorderRadius.circular(12.h)))),
                                                                              CustomImageView(imagePath: ImageConstant.imgCamera, height: 14.v, alignment: Alignment.center)
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
                                    padding:
                                        EdgeInsets.only(left: 5.h, right: 1.h),
                                    child: _buildFAQs(
                                        widget: "lbl59".tr,
                                        onTapFAQs: () {
                                          onTapAppointment();
                                        })),
                                SizedBox(height: 13.v),
                                Divider(indent: 5.h, endIndent: 1.h),
                                SizedBox(height: 13.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 5.h),
                                    child: _buildFAQs(
                                        widget: "msg41".tr,
                                        onTapFAQs: () {
                                          onTapFAQs();
                                        })),
                                SizedBox(height: 13.v),
                                Divider(indent: 5.h, endIndent: 1.h),
                                SizedBox(height: 13.v),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.h, right: 1.h),
                                    child: _buildFAQs(
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
                                    child: _buildFAQs(widget: "lbl61".tr)),
                                SizedBox(height: 89.v),
                                CustomImageView(
                                    imagePath: ImageConstant.imgThumbsUp,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    margin: EdgeInsets.only(right: 106.h),
                                    onTap: () {
                                      onTapImgThumbsUp();
                                    })
                              ]))
                    ]))),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return Container(
        decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary.withOpacity(1),
            boxShadow: [
              BoxShadow(
                  color: appTheme.black900.withOpacity(0.1),
                  spreadRadius: 2.h,
                  blurRadius: 2.h,
                  offset: Offset(0, -10))
            ]),
        child: CustomImageView(
            imagePath: ImageConstant.imgGroup19Gray500,
            height: 24.v,
            margin: EdgeInsets.fromLTRB(49.h, 28.v, 50.h, 27.v)));
  }

  /// Common widget
  Widget _buildFAQs({
    required String widget,
    Function? onTapFAQs,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFAQs?.call();
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomIconButton(
              height: 44.v,
              width: 43.h,
              padding: EdgeInsets.all(9.h),
              child:
                  CustomImageView(imagePath: ImageConstant.imgSettingsPrimary)),
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

  /// Navigates to the findDoctorsScreen when the action is triggered.
  onTapAppointment() {
    Get.toNamed(
      AppRoutes.findDoctorsScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapFAQs() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
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
}
