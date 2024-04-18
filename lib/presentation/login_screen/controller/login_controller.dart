import '../../../core/app_export.dart';
import '../models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj and loginStatus
class LoginController extends GetxController {
  TextEditingController inputController = TextEditingController();
  TextEditingController eyeController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;
  Rx<bool> isShowPassword = true.obs;

  // Define loginStatus variable
  var loginStatus = RxString("");

  @override
  void onClose() {
    super.onClose();
    inputController.dispose();
    eyeController.dispose();
  }
}
