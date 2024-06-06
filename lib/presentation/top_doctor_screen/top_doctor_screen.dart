import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'controller/top_doctor_controller.dart';
import 'widgets/fortyseven_item_widget.dart';
import 'models/fortyseven_item_model.dart';
import 'add_donation_screen.dart';
import 'api.dart';

class TopDoctorScreen extends GetWidget<TopDoctorController> {
  const TopDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: FutureBuilder<void>(
          future: controller.fetchDonations(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Failed to load donations. Please try again later.'));
            } else {
              return Padding(
                padding: EdgeInsets.only(top: 15.v, right: 11.h),
                child: Obx(
                      () => Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(height: 24.v),
                          itemCount: controller.topDoctorModelObj.value.fortysevenItemList.value.length,
                          itemBuilder: (context, index) {
                            FortysevenItemModel model = controller.topDoctorModelObj.value.fortysevenItemList.value[index];
                            return FortysevenItemWidget(model);
                          },
                        ),
                      ),
                      SizedBox(height: 20.v),
                      _buildAddDonationButton(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 25.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(left: 21.h, top: 20.v, bottom: 19.v),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(text: "التبرعات الطبية".tr),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconChevronLeftGray90024x24,
          margin: EdgeInsets.fromLTRB(32.h, 15.v, 32.h, 16.v),
        ),
      ],
    );
  }

  Widget _buildAddDonationButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        // Navigate to the donation adding page
        Get.to(() => AddDonationScreen());
      },
      label: Text(
        'إضافة تبرع جديد',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      icon: Icon(Icons.add),
      backgroundColor: Get.theme.primaryColor,
    );
  }
}
