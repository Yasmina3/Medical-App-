import '../models/doctor_item_model.dart';
import '../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

// ignore: must_be_immutable
class DoctorItemWidget extends StatelessWidget {
  DoctorItemWidget(
    this.doctorItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DoctorItemModel doctorItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 173.v,
          width: 120.h,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(right: 2.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.h,
                    vertical: 11.v,
                  ),
                  decoration: AppDecoration.outlineBlueGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.v),
                      Obx(
                        () => CustomImageView(
                          imagePath: doctorItemModelObj.widget!.value,
                          height: 71.adaptSize,
                          width: 71.adaptSize,
                          radius: BorderRadius.circular(
                            35.h,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(height: 38.v),
                      Obx(
                        () => Text(
                          doctorItemModelObj.widget1!.value,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Row(
                        children: [
                          Container(
                            width: 28.h,
                            decoration: AppDecoration.fillBlueGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder3,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgSignal,
                                  height: 10.adaptSize,
                                  width: 10.adaptSize,
                                  margin: EdgeInsets.symmetric(vertical: 1.v),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1.v),
                                  child: Obx(
                                    () => Text(
                                      doctorItemModelObj.fortySeven!.value,
                                      style: theme.textTheme.labelSmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => CustomImageView(
                              imagePath: doctorItemModelObj.widget2!.value,
                              height: 10.adaptSize,
                              width: 10.adaptSize,
                              margin: EdgeInsets.only(left: 8.h),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 2.h,
                              top: 3.v,
                            ),
                            child: Obx(
                              () => Text(
                                doctorItemModelObj.eightHundred!.value,
                                style: CustomTextStyles.interGray500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 49.v),
                  child: Obx(
                    () => Text(
                      doctorItemModelObj.drMarcusHorizon!.value,
                      style: CustomTextStyles.labelLargeGray700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
