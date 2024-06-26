import '../../../core/app_export.dart';
import '../models/create_new_password_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CreateNewPasswordScreen.
///
/// This class manages the state of the CreateNewPasswordScreen, including the
/// current createNewPasswordModelObj
class CreateNewPasswordController extends GetxController {
  TextEditingController inputController = TextEditingController();

  TextEditingController inputController1 = TextEditingController();

  Rx<CreateNewPasswordModel> createNewPasswordModelObj =
      CreateNewPasswordModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  @override
  void onClose() {
    super.onClose();
    inputController.dispose();
    inputController1.dispose();
  }
}
