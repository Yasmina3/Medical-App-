import '../models/doctors_item_model.dart';
import '../controller/find_doctors_controller.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

// ignore: must_be_immutable
class DoctorsItemWidget extends StatelessWidget {
  DoctorsItemWidget(
    this.doctorsItemModelObj, {
    Key? key,
    this.onTapDrAlex,
  }) : super(
          key: key,
        );

  DoctorsItemModel doctorsItemModelObj;

  var controller = Get.find<FindDoctorsController>();

  VoidCallback? onTapDrAlex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67.h,
      child: GestureDetector(
        onTap: () {
          onTapDrAlex?.call();
        },
        child: Column(
          children: [
            Obx(
              () => CustomImageView(
                imagePath: doctorsItemModelObj.drMarcus!.value,
                height: 64.adaptSize,
                width: 64.adaptSize,
                radius: BorderRadius.circular(
                  32.h,
                ),
              ),
            ),
            SizedBox(height: 9.v),
            Obx(
              () => Text(
                doctorsItemModelObj.drMarcus1!.value,
                style: CustomTextStyles.labelLargeBluegray80001,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
