import '../../../core/app_export.dart';
import '../models/sign_up_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SignUpOneScreen.
///
/// This class manages the state of the SignUpOneScreen, including the
/// current signUpOneModelObj
class SignUpOneController extends GetxController {
  TextEditingController inputController = TextEditingController();

  TextEditingController inputController1 = TextEditingController();

  TextEditingController inputController2 = TextEditingController();

  Rx<SignUpOneModel> signUpOneModelObj = SignUpOneModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    inputController.dispose();
    inputController1.dispose();
    inputController2.dispose();
  }
}
