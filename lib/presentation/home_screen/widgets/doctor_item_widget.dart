import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

class DoctorItemWidget extends StatelessWidget {
  final Map<String, dynamic> doctorData;

  DoctorItemWidget({required this.doctorData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapDoctor, // Call onTapDoctor function
      child: SizedBox(
        width: 120.h,
        child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(right: 2.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 9.h,
                      vertical: 5.v,
                    ),
                    decoration: AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 8.v),
                        CustomImageView(
                          imagePath: doctorData['gender'] == 'F'
                              ? "assets/images/DocF.png" // Path for female
                              : "assets/images/DocM.png", // Path for male
                          height: 80.adaptSize,
                          width: 80.adaptSize,
                          radius: BorderRadius.circular(35.h),
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 5.v),
                        Align(
                          child: Text(
                            doctorData['full_name'] ?? "",
                            style: CustomTextStyles.labelLargeGray700,
                          ),
                        ),
                        SizedBox(height: 5.v),
                        Text(
                          doctorData['speciality_name'] ?? "",
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 5.v),
                        Row(
                          children: [
                            Container(
                              width: 28.h,
                              decoration: AppDecoration.fillBlueGray.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder3,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgSignal,
                                    height: 10.adaptSize,
                                    width: 10.adaptSize,
                                    margin: EdgeInsets.symmetric(vertical: 1.v),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 1.v, bottom: 1.h),
                                    child: Text(
                                      doctorData['rating'].toString() ?? "",
                                      style: theme.textTheme.labelSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            CustomImageView(
                              imagePath: "assets/images/img_linkedin.svg",
                              height: 12.adaptSize,
                              width: 12.adaptSize,
                              margin: EdgeInsets.only(left: 8.h),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2.h, top: 3.v),
                              child: Text(
                                doctorData['location'] ?? "",
                                style: CustomTextStyles.interGray500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapDoctor() {
    Get.toNamed(
      AppRoutes.doctorDetailScreen,
    );
  }
  //   /// Navigates to the doctorDetailScreen when the action is triggered.
  // onTapDoctor(Map<String, dynamic> doctor) {
  //   Get.toNamed(
  //     AppRoutes.doctorDetailScreen,
  //     arguments: doctor,
  //   );
  // }
}
