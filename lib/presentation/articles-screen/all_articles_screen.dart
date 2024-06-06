import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller/all_articles_controller.dart';
import 'models/fortyseven2_item_model.dart';
import 'widgets/fortyseven2_item_widget.dart';

class AllArticlesScreen extends GetWidget<AllArticlesController> {
  const AllArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.02,
              horizontal: screenSize.width * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                controller
                    .allArticlessModelObj.value.fortyseven2ItemList.value.length,
                (index) {
                  Fortyseven2ItemModel model = controller.allArticlessModelObj
                      .value.fortyseven2ItemList.value[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle the tap event
                      // For now, let's navigate to the article URL
                      onTapArticle(model.url);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        model.title ?? '', // Display the article title
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .blue, // Set text color to blue for clickable effect
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leadingWidth: 25,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(left: 21, top: 19, bottom: 20),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(text: "lbl581".tr),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconChevronLeftGray90024x24,
          margin: EdgeInsets.fromLTRB(32, 14, 32, 17),
          onTap: onTapIconChevronLeft,
        ),
      ],
    );
  }

  void onTapIconChevronLeft() {
    Get.toNamed(AppRoutes.homeScreen);
  }

  void onTapArticle(Uri articleUrl) {
    if (articleUrl != null) {
       launchUrl(articleUrl as Uri);
     
      print("Navigating to Article URL: $articleUrl");
    } else {
      // Handle null URL case, for example, show a snackbar or do nothing
      print("Article URL is null");
    }
  }
}
