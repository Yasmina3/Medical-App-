import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.black900.withOpacity(0.2),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorOnprimary,
                          height: 129.adaptSize,
                          width: 129.adaptSize),
                      SizedBox(height: 5.v),
                      Text("lbl".tr, style: theme.textTheme.displayMedium),
                      SizedBox(height: 5.v)
                    ]))));
  }
}
