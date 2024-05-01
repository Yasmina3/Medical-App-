import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/custom_search_view.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'widgets/doctor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 19.v),
            Padding(
                padding: EdgeInsets.only(left: 25.h, right: 26.h),
                child: CustomSearchView(
                    controller: controller.searchController,
                    hintText: "msg29".tr)),
            SizedBox(height: 22.v),
            _buildCTA(),
            SizedBox(height: 20.v),
            _buildText(),
            SizedBox(height: 20.v),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(right: 23.0, left: 23.0),
                child: Row(
                  children: [
                    _buildDoctor(),
                    SizedBox(width: 20.0), // Adjust width as needed
                    _buildDoctor(),
                    SizedBox(width: 20.0), // Adjust width as needed
                    _buildDoctor(),
                    SizedBox(width: 20.0), // Adjust width as needed
                    _buildDoctor(),
                    SizedBox(width: 20.0), // Adjust width as needed
                    _buildDoctor(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 21.v),
            _buildText1(),
            SizedBox(height: 24.v),
            _buildArticle(),
            SizedBox(height: 49.v),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 84.v,
      leadingWidth: 41.h,
      title: Spacer(),
      actions: [
        Text(
          "msg28".tr,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(right: 10.h)),
      ],
    );
  }

  /// Section Widget
  Widget _buildCTA() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        decoration: AppDecoration.fillBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(left: 23.h, top: 19.v, bottom: 19.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 113.h,
                        child: Text("msg30".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium!
                                .copyWith(height: 1.39))),
                    SizedBox(height: 9.v),
                    CustomElevatedButton(
                        height: 29.v,
                        width: 97.h,
                        text: "lbl35".tr,
                        onPressed: onTapTxtWidget,
                        buttonStyle: CustomButtonStyles.fillPrimaryTL14,
                        buttonTextStyle: CustomTextStyles.labelLargeOnPrimary)
                  ])),
          Container(
              height: 130.v,
              width: 113.h,
              margin: EdgeInsets.only(top: 5.v),
              child: Stack(alignment: Alignment.center, children: [
                Opacity(
                    opacity: 0.5,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 113.adaptSize,
                            width: 113.adaptSize,
                            margin: EdgeInsets.only(bottom: 1.v),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(56.h),
                                border: Border.all(
                                    color: theme.colorScheme.onPrimary,
                                    width: 18.h))))),
                CustomImageView(
                    imagePath: ImageConstant.img7xm6,
                    radius: BorderRadius.circular(10.h),
                    alignment: Alignment.center)
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildText() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 11.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () {
                onTapTxtWidget();
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.v),
                  child: Text("<- " + "lbl36".tr,
                      style: CustomTextStyles.bodySmallInterPrimary))),
          Text("lbl37".tr, style: CustomTextStyles.titleMedium16)
        ]));
  }

  /// Section Widget
  Widget _buildDoctor() {
    return DoctorItemWidget();
  }

  /// Section Widget
  Widget _buildText1() {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, right: 11.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(
                  AppRoutes.articlesScreen); // Navigate to articles screen
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.v),
              child: Text(
                "<- " + "lbl36".tr,
                style: CustomTextStyles.bodySmallInterPrimary,
              ),
            ),
          ),
          Text(
            "lbl37".tr,
            style: CustomTextStyles.titleMedium16,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildArticle() {
    return Container(
        margin: EdgeInsets.only(left: 16.h, right: 24.h),
        padding: EdgeInsets.all(5.h),
        decoration: AppDecoration.outlineBluegray50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgRectangle460,
                  height: 46.v,
                  radius: BorderRadius.circular(8.h),
                  margin: EdgeInsets.only(bottom: 8.v)),
              Padding(
                  padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 7.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 179.h,
                            child: Text("msg_the_25_healthiest".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.labelMediumGray70001)),
                        SizedBox(height: 2.v),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_jun_10_2021".tr,
                                  style: CustomTextStyles.labelSmallGray500),
                              Container(
                                  height: 2.adaptSize,
                                  width: 2.adaptSize,
                                  margin: EdgeInsets.only(
                                      left: 5.h, top: 3.v, bottom: 4.v),
                                  decoration: BoxDecoration(
                                      color: appTheme.gray500,
                                      borderRadius:
                                          BorderRadius.circular(1.h))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text("lbl_5min_read".tr,
                                      style:
                                          CustomTextStyles.labelSmallGray500))
                            ])
                      ])),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgBookmark,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  margin: EdgeInsets.only(top: 6.v, right: 6.h, bottom: 34.v))
            ]));
  }

  /// Section Widget
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
            CustomImageView(
              imagePath: "assets/images/homeIcone.png",
              height: 30.adaptSize,
              width: 30.adaptSize,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 12.v),
            ),
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
            GestureDetector(
                onTap: onTapProfile, // Call onTapImgAIEssentialsIcon function
                child: CustomImageView(
                  imagePath: "assets/images/user.png",
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  alignment: Alignment.center,
                )),
          ],
        ),
      ),
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

  /// Navigates to the doctorDetailScreen when the action is triggered.
  onTapImgCalendarAdd() {
    Get.toNamed(
      AppRoutes.doctorDetailScreen,
    );
  }

  onTapProfile() {
    Get.toNamed(
      AppRoutes.profileScreen,
    );
  }
}
