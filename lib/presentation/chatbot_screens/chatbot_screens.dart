import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';

import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';

import 'package:tabibak/widgets/custom_elevated_button.dart';

import 'package:flutter/material.dart';

import 'package:tabibak/core/app_export.dart';

import 'controller/chat_controller.dart';


class ChatBotScreen extends GetWidget<chatBotController> {

  const ChatBotScreen({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(

        appBar: _buildAppBar(),

        body: SingleChildScrollView(

          child: Container(

            width: double.maxFinite,

            padding: EdgeInsets.only(

              left: 23.h,

              top: 112.v,

              right: 23.h,

              bottom:

                  20.v, // Added some padding at the bottom to avoid overflow

            ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                Text("بوت دردشة ", style: CustomTextStyles.titleLarge20),

                SizedBox(height: 91.v),

                CustomElevatedButton(text: " محادثة طبية عامة",
                 onPressed: () {

                    onTaptf1();

                  },),

                SizedBox(height: 39.v),

                CustomElevatedButton(

                  text: "بحث عن طبيب متخصص",

                  onPressed: () {

                    onTaptf();

                  },

                ),

                SizedBox(height: 25.v),
                Center(),

                SizedBox(height: 5.v),

              ],

            ),

          ),

        ),

      ),

    );

  }


  /// Section Widget

  PreferredSizeWidget _buildAppBar() {

    return CustomAppBar(

      height: 40.v,

      actions: [

        AppbarTrailingImage(

          imagePath: ImageConstant.imgButton,

          margin: EdgeInsets.symmetric(horizontal: 14.h),

        ),

      ],

    );

  }


  /// Navigates to the signUpOneScreen when the action is triggered.

  onTaptf() {

    Get.toNamed(

      AppRoutes.SymptomSelector,

    );

  }


  /// Navigates to the loginScreen when the action is triggered.

  onTapTxtWidget() {

    Get.toNamed(

      AppRoutes.chatWithBotScreen,

    );

  }
  
  void onTaptf1() {
    Get.toNamed(

      AppRoutes.SymptomSelector,

    );
  }

}

