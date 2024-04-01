import '../../../core/app_export.dart';
import '../models/edit_profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  TextEditingController inputController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController inputController1 = TextEditingController();

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> termsofServicePrivacyAgreement = false.obs;

  @override
  void onClose() {
    super.onClose();
    inputController.dispose();
    emailController.dispose();
    inputController1.dispose();
  }
}
