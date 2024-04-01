import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'models/time_item_model.dart';
import '../doctor_detail_screen/widgets/time_item_widget.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/doctor_detail_controller.dart';

// ignore_for_file: must_be_immutable
class DoctorDetailScreen extends GetWidget<DoctorDetailController> {
  const DoctorDetailScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 31.v),
          child: Column(
            children: [
              _buildWidget(),
              SizedBox(height: 25.v),
              _buildDescription(),
              Spacer(),
              _buildCalendar(),
              SizedBox(height: 30.v),
              Divider(
                indent: 20.h,
                endIndent: 20.h,
              ),
              SizedBox(height: 20.v),
              _buildTime(),
              SizedBox(height: 20.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildTf(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgTelevision,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "lbl54".tr,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // Navigate back to the previous page
            Navigator.of(context).pop();
          },
          child: AppbarTrailingImage(
            imagePath: ImageConstant.imgArrowRight,
            margin: EdgeInsets.fromLTRB(28.h, 18.v, 28.h, 14.v),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildWidget() {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          child: Stack(alignment: Alignment.topCenter, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "msg_dr_marcus_horizon".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "lbl38".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 10.v),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(left: 18.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgLinkedin,
                                  height: 13.adaptSize,
                                  width: 13.adaptSize,
                                  margin: EdgeInsets.only(bottom: 1.v),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3.h),
                                  child: Text(
                                    "lbl_800".tr,
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 18.v,
                          width: 41.h,
                          margin: EdgeInsets.only(left: 18.h),
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
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgSignal,
                                    height: 13.adaptSize,
                                    width: 13.adaptSize,
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 3.h),
                                  child: Text(
                                    "lbl_4_7".tr,
                                    style: CustomTextStyles.labelLargePrimary,
                                  ),
                                ),
                              ),
                              SizedBox(height: 11.v),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.v,
              ),
              CustomImageView(
                  imagePath: ImageConstant.imgPexelsCedricF115x115,
                  height: 120.adaptSize,
                  width: 120.adaptSize,
                  radius: BorderRadius.circular(
                    8.h,
                  )),
              SizedBox(
                width: 20,
              )
            ]),
          ]),
        ));
  }

  Widget _buildDescription() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Spacer(),
              Text(
                "lbl55".tr,
                style: CustomTextStyles.titleMedium16,
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            'هذا نص تجريبي لوصف الطبيب. يمكنك وضع هنا تفاصيل عن الخبرة والتخصصات والمهارات وغيرها من المعلومات الخاصة بالطبيب.',
            // Arabic description for the doctor
            style: theme.textTheme.bodyLarge,

            textDirection: TextDirection.rtl, // Right-to-left text direction
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCalendar() {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 21.h),
        child: IntrinsicWidth(
          child: SizedBox(
            height: 100.v,
            width: 354.h,
            child: EasyDateTimeLine(
              initialDate: controller.selectedDatesFromCalendar1.value,
              locale: 'en_US',
              headerProps: EasyHeaderProps(
                selectedDateFormat: SelectedDateFormat.fullDateDMY,
                monthPickerType: MonthPickerType.switcher,
                showHeader: false,
              ),
              dayProps: EasyDayProps(
                width: 46.h,
                height: 70.v,
              ),
              onDateChange: (selectedDate) {
                controller.selectedDatesFromCalendar1.value = selectedDate;
              },
              itemBuilder: (context, dayNumber, dayName, monthName, fullDate,
                  isSelected) {
                return isSelected
                    ? Container(
                        width: 46.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.h,
                          vertical: 13.v,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(
                            15.h,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 2.h),
                              child: Text(
                                dayName.toString(),
                                style: CustomTextStyles.bodySmallInterOnPrimary
                                    .copyWith(
                                  color: theme.colorScheme.onPrimary
                                      .withOpacity(1),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.v),
                              child: Text(
                                dayNumber.toString(),
                                style: CustomTextStyles.titleMediumOnPrimary_1
                                    .copyWith(
                                  color: theme.colorScheme.onPrimary
                                      .withOpacity(1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: 46.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.h,
                          vertical: 13.v,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimary.withOpacity(1),
                          borderRadius: BorderRadius.circular(
                            15.h,
                          ),
                          border: Border.all(
                            color: appTheme.blueGray50,
                            width: 1.h,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text(
                                dayName.toString(),
                                style: CustomTextStyles.bodySmallInterGray500
                                    .copyWith(
                                  color: appTheme.gray500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.v),
                              child: Text(
                                dayNumber.toString(),
                                style: CustomTextStyles.titleMediumGray700
                                    .copyWith(
                                  color: appTheme.gray700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTime() {
    return Wrap(
      runSpacing: 13.v,
      spacing: 13.h,
      children: List<Widget>.generate(
        controller.doctorDetailModelObj.value.timeItemList.value.length,
        (index) {
          TimeItemModel model =
              controller.doctorDetailModelObj.value.timeItemList.value[index];

          return TimeItemWidget(
            model,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTf() {
    return CustomElevatedButton(
      height: 50.v,
      text: "lbl56".tr,
      margin: EdgeInsets.only(
        left: 55.h,
        right: 54.h,
        bottom: 36.v,
      ),
      buttonStyle: CustomButtonStyles.fillPrimaryTL25,
    );
  }
}
