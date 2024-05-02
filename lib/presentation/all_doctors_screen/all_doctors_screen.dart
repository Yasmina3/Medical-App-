import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'controller/all_doctors_controller.dart';
import 'models/fortyseven2_item_model.dart';
import 'widgets/fortyseven2_item_widget.dart';
import 'api.dart';

class AllDoctorsScreen extends GetWidget<AllDoctorsController> {
   AllDoctorsScreen({Key? key}) : super(key: key);
  final AllDoctorsController controller = Get.put(AllDoctorsController());
  final int? specId = Get.arguments?['spec_id'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top:0),
          child: FutureBuilder<void>(
            future: controller.fetchSpecialists(specId!), // Using controller.fetchSpecialists as the future
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return _buildListView(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListView(context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.allDoctorsModelObj.value
              .fortyseven2ItemList.value.length,
          itemBuilder: (context, index) {
            Fortyseven2ItemModel model =
            controller.allDoctorsModelObj.value.fortyseven2ItemList.value[index];

            int? doctorId = model.id?.value; // Changed variable name to camelCase for better readability

            print("doctor_id = $doctorId"); // Print the actual doctor id
            return Fortyseven2ItemWidget(
              model,
              onTapDoctor: () {
                Get.toNamed(AppRoutes.doctorDetailScreen, arguments: {
                  "doctor_id": doctorId.toString(), // Pass the actual doctor id as string
                });
              },
              screenSize: screenSize,
            );
          },

        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leadingWidth: 25,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(left: 21, top: 19, bottom: 20),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(text: "lbl58".tr),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconChevronLeftGray90024x24,
          margin: EdgeInsets.fromLTRB(32, 14, 32, 17),
          onTap: onTapIconChevronLeft,
        ),
      ],
    );
  }

  void onTapIconChevronLeft() {
    Get.back();
  }

  void onTapDoctor() {
    Get.toNamed(AppRoutes.doctorDetailScreen);
  }
}
