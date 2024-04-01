import '../models/nineteen_item_model.dart';
import '../controller/find_doctors_controller.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

// ignore: must_be_immutable
class NineteenItemWidget extends StatelessWidget {
  NineteenItemWidget(
    this.nineteenItemModelObj, {
    Key? key,
    this.onTapCovid,
    this.onTapSurgeon,
    this.onTapCardiologist,
  }) : super(
          key: key,
        );

  NineteenItemModel nineteenItemModelObj;

  var controller = Get.find<FindDoctorsController>();

  VoidCallback? onTapCovid;

  VoidCallback? onTapSurgeon;

  VoidCallback? onTapCardiologist;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onTapCovid?.call();
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56.v,
                  width: 64.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 12.v,
                  ),
                  decoration: AppDecoration.outlineBlack.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  ),
                  child: Obx(
                    () => CustomImageView(
                      imagePath: nineteenItemModelObj.nineteen!.value,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Obx(
                    () => Text(
                      nineteenItemModelObj.nineteen1!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onTapSurgeon?.call();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Column(
              children: [
                Container(
                  height: 56.v,
                  width: 64.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 12.v,
                  ),
                  decoration: AppDecoration.outlineBlack.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  ),
                  child: Obx(
                    () => CustomImageView(
                      imagePath: nineteenItemModelObj.nineteen2!.value,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                Obx(
                  () => Text(
                    nineteenItemModelObj.widget!.value,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onTapCardiologist?.call();
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 12.v,
              bottom: 1.v,
            ),
            child: Column(
              children: [
                Obx(
                  () => CustomImageView(
                    imagePath: nineteenItemModelObj.widget1!.value,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                  ),
                ),
                SizedBox(height: 22.v),
                Obx(
                  () => Text(
                    nineteenItemModelObj.widget2!.value,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
