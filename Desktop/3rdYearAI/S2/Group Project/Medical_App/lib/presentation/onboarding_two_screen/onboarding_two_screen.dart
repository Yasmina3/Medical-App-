import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/headline_item_widget.dart';
import 'models/headline_item_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/onboarding_two_controller.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: _buildAppBar(theme),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Adjust spacing as needed
              CustomImageView(
                imagePath: ImageConstant.img7xm5,
                width: double.infinity,
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 20), // Adjust spacing as needed
              _buildHeadline(theme),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(ThemeData theme) {
    return AppBar(
      actions: [
        AppbarSubtitleFive(
          text: "lbl_skip".tr,
          margin: EdgeInsets.symmetric(horizontal: 22, vertical: 19),
        ),
      ],
    );
  }

Widget _buildHeadline(ThemeData theme) {
  return SizedBox(
    height: 300, // Adjust the height as needed
    child: CarouselSlider.builder(
      options: CarouselOptions(
        height: 300, // Adjust as needed
        initialPage: 0,
        autoPlay: true,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
        onPageChanged: (
          index,
          reason,
        ) {
          // Assuming you have access to the controller
          // controller.sliderIndex.value = index;
        },
      ),
      itemCount: 5, // Adjust as needed
      itemBuilder: (context, index, realIndex) {
        // Replace with your actual data
        return SingleChildScrollView(
          child: HeadlineItemWidget(HeadlineItemModel()),
        );
      },
    ),
  );
}

}