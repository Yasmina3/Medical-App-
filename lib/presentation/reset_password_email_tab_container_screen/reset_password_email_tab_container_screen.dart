import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/presentation/reset_password_email_page/reset_password_email_page.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/reset_password_email_tab_container_controller.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordEmailTabContainerScreen
    extends GetWidget<ResetPasswordEmailTabContainerController> {
  const ResetPasswordEmailTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 26.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 37.h),
                  child: Text(
                    "msg19".tr,
                    style: CustomTextStyles.headlineSmallInterGray900,
                  ),
                ),
              ),
              SizedBox(height: 21.v),
              Container(
                width: 323.h,
                margin: EdgeInsets.only(
                  left: 24.h,
                  right: 28.h,
                ),
                child: Text(
                  "msg20".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              SizedBox(height: 17.v),
              _buildTabview(),
              SizedBox(
                height: 525.v,
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    ResetPasswordEmailPage(),
                    ResetPasswordEmailPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 40.v,
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.symmetric(horizontal: 15.h),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
      height: 51.v,
      width: 327.h,
      decoration: BoxDecoration(
        color: appTheme.gray5004,
        borderRadius: BorderRadius.circular(
          25.h,
        ),
        border: Border.all(
          color: appTheme.gray200,
          width: 1.h,
        ),
      ),
      child: TabBar(
        controller: controller.tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.primaryContainer,
        unselectedLabelColor: theme.colorScheme.primary,
        tabs: [
          Tab(
            child: Text(
              "msg21".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl28".tr,
            ),
          ),
        ],
      ),
    );
  }
}
