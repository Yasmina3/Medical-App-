import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/widget_item_widget.dart';
import 'models/widget_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/all_specialties_controller.dart';

class AllSpecialtiesScreen extends GetWidget<AllSpecialtiesController> {
  const AllSpecialtiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Padding(
                padding: EdgeInsets.only(left: 19.h, top: 27.v, right: 19.h),
                child: Obx(() => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 23.v);
                    },
                    itemCount: controller.allSpecialtiesModelObj.value
                        .widgetItemList.value.length,
                    itemBuilder: (context, index) {
                      WidgetItemModel model = controller.allSpecialtiesModelObj
                          .value.widgetItemList.value[index];
                      return WidgetItemWidget(model, onTapDoctor: () {
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
            margin: EdgeInsets.only(left: 21.h, top: 19.v, bottom: 21.v)),
        centerTitle: true,
        title: AppbarSubtitleThree(text: "lbl53".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgArrowRight,
              margin: EdgeInsets.all(16.h))
        ]);
  }

  /// Navigates to the allDoctorsScreen when the action is triggered.
  onTapDoctor() {
    Get.toNamed(
      AppRoutes.allDoctorsScreen,
    );
  }
}
