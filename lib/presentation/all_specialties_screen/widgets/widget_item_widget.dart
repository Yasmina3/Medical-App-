import '../models/widget_item_model.dart';
import '../controller/all_specialties_controller.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

// ignore: must_be_immutable
class WidgetItemWidget extends StatelessWidget {
  WidgetItemWidget(
      this.widgetItemModelObj, {
        Key? key,
        this.onTapDoctor,
      }) : super(
    key: key,
  );

  WidgetItemModel widgetItemModelObj;

  var controller = Get.find<AllSpecialtiesController>();

  VoidCallback? onTapDoctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapDoctor?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.h,
          vertical: 17.v,
        ),
        decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 7.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 2.h),
                    child: Obx(
                          () => Text(
                        widgetItemModelObj.widget!.value,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(right: 17.h),
                    child: Obx(
                          () => Text(
                        widgetItemModelObj.twelveThousand!.value,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                            () => Text(
                          widgetItemModelObj.widget1!.value,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgLinkedin,
                        width: 9.h,
                        margin: EdgeInsets.only(
                          left: 7.h,
                          top: 2.v,
                          bottom: 3.v,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(
                  () => CustomImageView(
                imagePath: widgetItemModelObj.widget2!.value,
                height: 45.v,
                margin: EdgeInsets.only(
                  left: 8.h,
                  top: 10.v,
                  bottom: 9.v,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}