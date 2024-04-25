import 'package:tabibak/presentation/UserController.dart';

import '../models/time_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import '../models/doctor_detail_model.dart';
// ignore: must_be_immutable
class TimeItemWidget extends StatelessWidget {
  TimeItemWidget(
    this.timeItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TimeItemModel timeItemModelObj;


  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 23.h,
          vertical: 11.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          timeItemModelObj.am!.value,
          style: TextStyle(
            color: (timeItemModelObj.isSelected?.value ?? true)
                ? Colors.white
                : Colors.black.withOpacity(0.6),
            fontSize: 12.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        selected: (timeItemModelObj.isSelected?.value ?? false),
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        selectedColor: theme.colorScheme.primary.withOpacity(1),
        shape: (timeItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.primary.withOpacity(1),
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  15.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.teal50,
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  15.h,
                ),
              ),
        onSelected: (value) {
          if(value==true){
            int? session_id = timeItemModelObj.session_id?.value;
            Get.find<UserController>().selected_Slot.value = session_id as int;

          }
          print("value = $value and ${Get.find<UserController>().selected_Slot.value}");
          timeItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
