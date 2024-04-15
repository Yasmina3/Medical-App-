import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/choose_age_controller.dart';
import "../UserController.dart" ;

class ChooseAgeScreen extends GetWidget<ChooseAgeController> {
  ChooseAgeScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
 // UserController Ucontroller = Get.find<UserController>();
  bool empty_name = false;


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView( // Makes the page scrollable
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 13.v),
            child: Column(
              children: [
                AnotherStepper(
                  stepperDirection: Axis.horizontal,
                  activeIndex: 0,
                  barThickness: 5,
                  inverted: true,
                  stepperList: [
                    StepperData(),
                    StepperData(),
                    StepperData(),
                    StepperData(),
                    StepperData()
                  ],
                ),
                SizedBox(height: 50.v), // Adjusted spacing
                _buildProfilePictureEdit(),
                SizedBox(height: 72.v),
                Text("msg14".tr, style: theme.textTheme.headlineLarge),
                SizedBox(height: 41.v),
                _buildNameTextField(),
                SizedBox(height: 63.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildTf(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 70.0, // Set the desired height for the app bar
      actions: [
        AppbarTitle(
          text: "lbl".tr,
          margin: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.v)
        )
      ]
    );
  }

  Widget _buildProfilePictureEdit() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 200.v,
          width: 198.h,
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder99,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgChangeImage,
            width: 198.h,
            radius: BorderRadius.circular(99.h),
            alignment: Alignment.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10.v, right: 10.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.6),
          ),
          child: IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () async {
              final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                // Use the picked file (upload it, display it, etc.)
                // For example, if you want to display the image, you can use the Image.file constructor:
                // setState(() {
                //   _imageFile = File(pickedFile.path);
                // });
              } else {
                // User canceled the image picker
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNameTextField() {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: "enter your name",
            hintStyle: CustomTextStyles.titleMediumNunitoOnPrimary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            fillColor: Color(0XCE1D24CA),
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.v,
              horizontal: 20.h,
            ),
          ),
          style: CustomTextStyles.titleMediumNunitoOnPrimary,
        ),
        empty_name == true ? Container(
          padding: EdgeInsets.only(top:30.v),
          child : Text(
            "Enter a valid name, at least 6 characters",
            style : TextStyle(
              fontSize: 13,
              color: Colors.red,
            )
          )
        ):
            SizedBox(),
      ],
    );
  }

  Widget _buildTf() {
    final UserController userController = Get.find<UserController>();

    return CustomElevatedButton(
      height: 59,
      width: 149,
      text: "lbl16".tr,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: CustomTextStyles.titleMediumNunitoOnPrimaryExtraBold,
      onPressed: () {
        String name = nameController.text;
        if (name.length >= 6) {
          print("im in if");
          userController.name.value = nameController.text;
          print(" email = ${userController.email.value} and password = ${userController.password.value}");
          if (onTaptf != null) {
            onTaptf();
          }
        } else{
          print("im in else");

        }
      },
    );
  }


  void onTaptf() {
    Get.toNamed(
      AppRoutes.chooseGenderAgeScreen,
    );
  }
}
