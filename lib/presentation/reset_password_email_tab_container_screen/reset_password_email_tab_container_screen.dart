import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/presentation/reset_password_email_page/reset_password_email_page.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/reset_password_email_tab_container_controller.dart';

class ResetPasswordEmailTabContainerScreen extends GetWidget<ResetPasswordEmailTabContainerController> {
  const ResetPasswordEmailTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double referenceWidth = 375; // Reference width for layout design
    final double referenceHeight = 812; // Reference height for layout design

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double scaleFactorWidth = screenWidth / referenceWidth;
    final double scaleFactorHeight = screenHeight / referenceHeight;

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(scaleFactorWidth, scaleFactorHeight),
        body: Column(
          children: [
            SizedBox(height: 26 * scaleFactorHeight),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 37 * scaleFactorWidth),
                child: Text(
                  "msg19".tr,
                  style: CustomTextStyles.headlineSmallInterGray900,
                ),
              ),
            ),
            SizedBox(height: 21 * scaleFactorHeight),
            Container(
              width: 323 * scaleFactorWidth,
              margin: EdgeInsets.only(left: 24 * scaleFactorWidth, right: 28 * scaleFactorWidth),
              child: Text(
                "msg20".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge!.copyWith(height: 1.50),
              ),
            ),
            SizedBox(height: 17 * scaleFactorHeight),
            _buildTabview(scaleFactorWidth, scaleFactorHeight),
            Expanded(
              child: Container(
                width: double.infinity,
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    ResetPasswordEmailPage(),
                    ResetPasswordEmailPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(double scaleFactorWidth, double scaleFactorHeight) {
    return CustomAppBar(
      height: 40 * scaleFactorHeight,
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.symmetric(horizontal: 15 * scaleFactorWidth),
        ),
      ],
    );
  }

  Widget _buildTabview(double scaleFactorWidth, double scaleFactorHeight) {
    return Container(
      height: 51 * scaleFactorHeight,
      width: 327 * scaleFactorWidth,
      decoration: BoxDecoration(
        color: appTheme.gray5004,
        borderRadius: BorderRadius.circular(25 * scaleFactorHeight),
        border: Border.all(color: appTheme.gray200, width: 1),
      ),
      child: TabBar(
        controller: controller.tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.primaryContainer,
        unselectedLabelColor: theme.colorScheme.primary,
        tabs: [
          Tab(child: Text("msg21".tr)),
          Tab(child: Text("lbl28".tr)),
        ],
      ),
    );
  }
}
