import '../models/time_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

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
            color: (timeItemModelObj.isSelected?.value ?? false)
                ? theme.colorScheme.onPrimaryContainer
                : appTheme.teal50,
            fontSize: 12.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (timeItemModelObj.isSelected?.value ?? false),
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        selectedColor: theme.colorScheme.onPrimary.withOpacity(1),
        shape: (timeItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.teal100,
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
          timeItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
