import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_search_view.dart';
import 'widgets/nineteen_item_widget.dart';
import 'models/nineteen_item_model.dart';
import 'widgets/doctors_item_widget.dart';
import 'models/doctors_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/find_doctors_controller.dart';

class FindDoctorsScreen extends GetWidget<FindDoctorsController> {
  const FindDoctorsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<List<List<String>>> matrix = [
      [
        ["lbl48",ImageConstant.imgIconDoctor],
        ["lbl49",ImageConstant.imgIconLungs],
        ["lbl50",ImageConstant.imgIconDentist],

      ],
      [
        ["قلب",ImageConstant.imgIconCardiologist],
        ["جراحة",ImageConstant.imgIconSyringe],
        ["جميع التخصصات",ImageConstant.imgFloatingIcon],
      ],
    ];

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 20.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.h),
                      child: CustomSearchView(
                          controller: controller.searchController,
                          hintText: "lbl46".tr)),
                  SizedBox(height: 22.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 24.h),
                          child: Text("lbl47".tr,
                              style: CustomTextStyles.titleLargeSemiBold))),
                  SizedBox(height: 18.v),
                  _buildNineteen(matrix),
                  SizedBox(height: 24.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 23.h),
                          child: Text("msg37".tr,
                              style: CustomTextStyles.titleMediumGray900_1))),
                  SizedBox(height: 15.v),
                  _buildDoctors()
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 48.v,
        centerTitle: true,
        title: AppbarSubtitleFour(text: "lbl45".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgArrowRight,
              margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.v),
              onTap: () {
                onTapArrowRight();
              })
        ]);
  }


  /// Section Widget
  Widget _buildNineteen(var matrix) {
    return Padding(
        padding: EdgeInsets.only(left: 11.h,bottom: 10.h),
        child:  GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: matrix[0].length,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 20.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount:6 ,
            itemBuilder: (context, index) {
              int row = index ~/ 3;
              int column = index % 3;

              print("row={$row} col={$column}");

              List<String> widget = matrix[row][column] ;
              return _buildSpeciality(iconLungs: widget[1], widget: widget[0].tr);
            }
        )
    );
  }

  /// Section Widget
  Widget _buildDoctors() {
    return SizedBox(
        height: 89.v,
        child: Obx(() => ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 22.h);
            },
            itemCount: controller
                .findDoctorsModelObj.value.doctorsItemList.value.length,
            itemBuilder: (context, index) {
              DoctorsItemModel model = controller
                  .findDoctorsModelObj.value.doctorsItemList.value[index];
              return DoctorsItemWidget(model, onTapDrAlex: () {
                onTapDrAlex();
              });
            })));
  }

  /// Common widget
  Widget _buildSpeciality({
    required String iconLungs,
    required String widget,
    Function? onTapLungs,
  }) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(
            AppRoutes.allDoctorsScreen,
          );
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          widget=="جميع التخصصات" ?Container(
              height: 60.v,
              width: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 12.v),

              child: CustomImageView(
                  imagePath: iconLungs,
                  height: 80.adaptSize,
                  width: 80.adaptSize,
                  alignment: Alignment.centerRight)):
          Container(
              height: 56.v,
              width: 64.h,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),

              child: CustomImageView(
                  imagePath: iconLungs,
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  alignment: Alignment.center)),

          SizedBox(height: 10.v),
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(widget,
                  style: CustomTextStyles.bodyMedium15
                      .copyWith(color: theme.colorScheme.primaryContainer)))
        ]));
  }



  /// Navigates to the homeScreen when the action is triggered.
  onTapArrowRight() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }

  /// Navigates to the allDoctorsScreen when the action is triggered.
  onTapGeneral() {
    Get.toNamed(
      AppRoutes.allDoctorsScreen,
    );
  }

  /// Navigates to the allDoctorsScreen when the action is triggered.
  onTapLungs() {
    Get.toNamed(
      AppRoutes.allDoctorsScreen,
    );
  }

  /// Navigates to the allDoctorsScreen when the action is triggered.
  onTapDentist() {
    Get.toNamed(
      AppRoutes.allDoctorsScreen,
    );
  }

  /// Navigates to the allDoctorsScreen when the action is triggered.
  onTapPsychiatrist() {
    Get.toNamed(
      AppRoutes.allDoctorsScreen,
    );
  }

  /// Navigates to the allDoctorsScreen when the action is triggered.
  onTapCovid() {
    Get.toNamed(
      AppRoutes.allDoctorsScreen,
    );
  }

  /// Navigates to the allDoctorsScreen when the action is triggered.
  onTapSurgeon() {
    Get.toNamed(
      AppRoutes.allDoctorsScreen,
    );
  }

  /// Navigates to the allDoctorsScreen when the action is triggered.
  onTapCardiologist() {
    Get.toNamed(
      AppRoutes.allDoctorsScreen,
    );
  }

  /// Navigates to the doctorDetailScreen when the action is triggered.
  onTapDrAlex() {
    Get.toNamed(
      AppRoutes.doctorDetailScreen,
    );
  }
}
