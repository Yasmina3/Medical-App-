import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/chat_with_bot_controller.dart';
// ignore_for_file: must_be_immutable
class ChatWithBotScreen extends GetWidget<ChatWithBotController> {
  const ChatWithBotScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 32.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildConsultationStart(),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgClose40x40,
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 13.h,
                        top: 4.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_bot".tr,
                            style:
                            CustomTextStyles.titleSmallOnPrimaryContainer,
                          ),
                          SizedBox(height: 4.v),
                          Text(
                            "lbl_10_min_ago".tr,
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  right: 78.h,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 8.v,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.colorScheme.primary.withOpacity(0.1),
                  ),
                  child: Text(
                    "msg31".tr,
                    style: CustomTextStyles.bodyLargeGray700,
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 98.h),
                child: _buildChat4(
                  widget: "msg32".tr,
                ),
              ),
              SizedBox(height: 6.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgAvatar,
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 13.h,
                        top: 4.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_bot".tr,
                            style:
                            CustomTextStyles.titleSmallOnPrimaryContainer,
                          ),
                          SizedBox(height: 4.v),
                          Text(
                            "lbl_5_min_ago".tr,
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.v),
              Container(
                width: 237.h,
                margin: EdgeInsets.only(
                  left: 1.h,
                  right: 97.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 13.h,
                  vertical: 5.v,
                ),
                decoration: AppDecoration.fillPrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 3.v),
                    SizedBox(
                      width: 121.h,
                      child: Text(
                        "msg33".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyLargeGray700.copyWith(
                          height: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 98.h),
                child: _buildChat4(
                  widget: "msg34".tr,
                ),
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgClose40x40,
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 13.h,
                        top: 4.v,
                        bottom: 2.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_bot".tr,
                            style:
                            CustomTextStyles.titleSmallOnPrimaryContainer,
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            "lbl_online".tr,
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 9.v),
              Container(
                height: 22.v,
                width: 58.h,
                margin: EdgeInsets.only(left: 1.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 13.h,
                  vertical: 8.v,
                ),
                decoration: AppDecoration.fillPrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL5,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroup141,
                  height: 5.v,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              SizedBox(height: 9.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildTypeMessage(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 23.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(
          left: 19.h,
          top: 19.v,
          bottom: 20.v,
        ),
      ),
      title: AppbarSubtitleOne(
        text: "lbl40".tr,
        margin: EdgeInsets.only(left: 120.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconChevronLeftGray90024x24,
          margin: EdgeInsets.fromLTRB(34.h, 14.v, 34.h, 17.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildConsultationStart() {
    return Container(
      margin: EdgeInsets.only(left: 1.h),
      padding: EdgeInsets.symmetric(
        horizontal: 98.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Text(
            "lbl41".tr,
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
          Text(
            "lbl2".tr,
            style: CustomTextStyles.titleMediumGray500,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTypeMessage() {
    return Padding(
      padding: EdgeInsets.only(left: 21.h, right: 21.h, bottom: 26.v),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: controller.typeMessageController,
              hintText: "lbl42".tr,
              textInputAction: TextInputAction.done,
              contentPadding: EdgeInsets.only(left: 30.h, top: 15.v, bottom: 15.v),
            ),
          ),
          SizedBox(width: 10.h), // Adjust spacing between icons
          IconButton(
            icon: Icon(Icons.attach_file), // Built-in attach icon
            onPressed: () {
              // Add action for attaching files
            },
          ),
          IconButton(
            icon: Icon(Icons.send), // Built-in send icon
            onPressed: () {
              // Add action for sending message
            },
          ),
          IconButton(
            icon: Icon(Icons.mic), // Built-in microphone icon
            onPressed: () {
              // Add action for using microphone
            },
          ),
        ],
      ),
    );
  }


  /// Common widget
  Widget _buildChat4({required String widget}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              width: 201.h,
              margin: EdgeInsets.only(
                left: 9.h,
                top: 4.v,
              ),
              child: Text(
                widget,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyLargeOnPrimary.copyWith(
                  color: theme.colorScheme.onPrimary.withOpacity(1),
                  height: 1.11,
                ),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgBasicCheckAllBig,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.only(
              top: 36.v,
              bottom: 6.v,
            ),
          ),
        ],
      ),
    );
  }
}