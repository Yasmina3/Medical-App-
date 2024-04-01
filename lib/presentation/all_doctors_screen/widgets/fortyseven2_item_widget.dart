import '../models/fortyseven2_item_model.dart';
import '../controller/all_doctors_controller.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

// ignore: must_be_immutable
class Fortyseven2ItemWidget extends StatelessWidget {
  Fortyseven2ItemWidget(
    this.fortyseven2ItemModelObj, {
    Key? key,
    this.onTapDoctor,
  }) : super(
          key: key,
        );

  Fortyseven2ItemModel fortyseven2ItemModelObj;

  var controller = Get.find<AllDoctorsController>();

  VoidCallback? onTapDoctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapDoctor?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
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
                              fortyseven2ItemModelObj.drMarcusHorizon!.value,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                        SizedBox(height: 11.v),
                        Padding(
                          padding: EdgeInsets.only(left: 29.h),
                          child: Obx(
                            () => Text(
                              fortyseven2ItemModelObj.widget!.value,
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
                                      imagePath: fortyseven2ItemModelObj
                                          .drMarcusHorizon1!.value,
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
                                      fortyseven2ItemModelObj.fortySeven!.value,
                                      style: CustomTextStyles.labelLargePrimary,
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
                            imagePath:
                                fortyseven2ItemModelObj.mdechezvous!.value,
                            height: 13.adaptSize,
                            width: 13.adaptSize,
                            margin: EdgeInsets.only(bottom: 1.v),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Obx(
                            () => Text(
                              fortyseven2ItemModelObj.distance!.value,
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
          Obx(
            () => CustomImageView(
              imagePath: fortyseven2ItemModelObj.drMarcusHorizon2!.value,
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
      ),
    );
  }
}
