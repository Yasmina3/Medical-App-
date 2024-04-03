import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'controller/all_doctors_controller.dart';
import 'models/fortyseven2_item_model.dart';
import 'widgets/fortyseven2_item_widget.dart';
class AllDoctorsScreen extends GetWidget<AllDoctorsController> {
  const AllDoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.allDoctorsModelObj.value.fortyseven2ItemList.value.length,
                itemBuilder: (context, index) {
                  Fortyseven2ItemModel model = controller.allDoctorsModelObj.value.fortyseven2ItemList.value[index];
                  return Fortyseven2ItemWidget(model, onTapDoctor: onTapDoctor);
                },
              ),
            ),
          ],
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
      title: AppbarSubtitleOne(text: "lbl58".tr),
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

  void onTapDoctor() {
    Get.toNamed(AppRoutes.doctorDetailScreen);
  }
}
