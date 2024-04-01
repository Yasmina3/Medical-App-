import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/fortyseven2_item_widget.dart';
import 'models/fortyseven2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/all_doctors_controller.dart';

class AllDoctorsScreen extends GetWidget<AllDoctorsController> {
  const AllDoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Padding(
                padding: EdgeInsets.only(top: 14.v, right: 11.h),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 24.v);
                    },
                    itemCount: controller.allDoctorsModelObj.value
                        .fortyseven2ItemList.value.length,
                    itemBuilder: (context, index) {
                      Fortyseven2ItemModel model = controller.allDoctorsModelObj
                          .value.fortyseven2ItemList.value[index];
                      return Fortyseven2ItemWidget(model, onTapDoctor: () {
                        onTapDoctor();
                      });
                    })))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 25.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgComponent1,
            margin: EdgeInsets.only(left: 21.h, top: 19.v, bottom: 20.v)),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl58".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgIconChevronLeftGray90024x24,
              margin: EdgeInsets.fromLTRB(32.h, 14.v, 32.h, 17.v),
              onTap: () {
                onTapIconChevronLeft();
              })
        ]);
  }

  /// Navigates to the homeScreen when the action is triggered.
  onTapIconChevronLeft() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }

  /// Navigates to the doctorDetailScreen when the action is triggered.
  onTapDoctor() {
    Get.toNamed(
      AppRoutes.doctorDetailScreen,
    );
  }
}
