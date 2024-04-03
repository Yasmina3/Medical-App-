import '../models/fortyseven1_item_model.dart';
import '../controller/suggestions_controller.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

// ignore: must_be_immutable
class Fortyseven1ItemWidget extends StatelessWidget {
  Fortyseven1ItemWidget(
    this.fortyseven1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Fortyseven1ItemModel fortyseven1ItemModelObj;

  var controller = Get.find<SuggestionsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 125.v,
          width: 239.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 125.v,
                  width: 217.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(right: 10.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.h,
                            vertical: 34.v,
                          ),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 13.v),
                              Obx(
                                () => Text(
                                  fortyseven1ItemModelObj.chardiologist!.value,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              SizedBox(height: 6.v),
                              SizedBox(
                                height: 18.v,
                                width: 41.h,
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 18.v,
                                        width: 41.h,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 3.h,
                                          vertical: 2.v,
                                        ),
                                        decoration:
                                            AppDecoration.fillBlueGray.copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder3,
                                        ),
                                        child: Obx(
                                          () => CustomImageView(
                                            imagePath: fortyseven1ItemModelObj
                                                .chardiologist1!.value,
                                            height: 13.adaptSize,
                                            width: 13.adaptSize,
                                            alignment: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 3.h),
                                        child: Obx(
                                          () => Text(
                                            fortyseven1ItemModelObj
                                                .fortySeven!.value,
                                            style: CustomTextStyles
                                                .labelLargePrimary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 37.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(
                                () => CustomImageView(
                                  imagePath: fortyseven1ItemModelObj
                                      .mdechezvous!.value,
                                  height: 13.adaptSize,
                                  width: 13.adaptSize,
                                  margin: EdgeInsets.only(bottom: 1.v),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: Obx(
                                  () => Text(
                                    fortyseven1ItemModelObj.distance!.value,
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 18.v),
                          child: Obx(
                            () => Text(
                              fortyseven1ItemModelObj.drMarcusHorizon!.value,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 125.v,
                  width: 239.h,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 21.h,
                            vertical: 17.v,
                          ),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Obx(
                                  () => Text(
                                    fortyseven1ItemModelObj
                                        .drMarcusHorizon1!.value,
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ),
                              ),
                              SizedBox(height: 11.v),
                              Padding(
                                padding: EdgeInsets.only(left: 29.h),
                                child: Obx(
                                  () => Text(
                                    fortyseven1ItemModelObj.widget!.value,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.v),
                              Container(
                                height: 18.v,
                                width: 41.h,
                                margin: EdgeInsets.only(left: 29.h),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 18.v,
                                        width: 41.h,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 3.h,
                                          vertical: 2.v,
                                        ),
                                        decoration:
                                            AppDecoration.fillBlueGray.copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder3,
                                        ),
                                        child: Obx(
                                          () => CustomImageView(
                                            imagePath: fortyseven1ItemModelObj
                                                .chardiologist2!.value,
                                            height: 13.adaptSize,
                                            width: 13.adaptSize,
                                            alignment: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 3.h),
                                        child: Obx(
                                          () => Text(
                                            fortyseven1ItemModelObj
                                                .fortySeven1!.value,
                                            style: CustomTextStyles
                                                .labelLargePrimary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 17.v),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 51.h),
                          child: Row(
                            children: [
                              Obx(
                                () => CustomImageView(
                                  imagePath: fortyseven1ItemModelObj
                                      .mdechezvous1!.value,
                                  height: 13.adaptSize,
                                  width: 13.adaptSize,
                                  margin: EdgeInsets.only(bottom: 1.v),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: Obx(
                                  () => Text(
                                    fortyseven1ItemModelObj.distance1!.value,
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => CustomImageView(
            imagePath: fortyseven1ItemModelObj.chardiologist3!.value,
            height: 111.adaptSize,
            width: 111.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
            margin: EdgeInsets.only(
              top: 8.v,
              bottom: 6.v,
            ),
          ),
        ),
      ],
    );
  }
}
