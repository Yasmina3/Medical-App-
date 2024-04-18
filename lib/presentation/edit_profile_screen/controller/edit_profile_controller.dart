import '../../../core/app_export.dart';
import '../models/edit_profile_model.dart';
import 'package:flutter/material.dart';
import '../api.dart';

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

  void saveProfileChanges() async {
    int patientId = 1; // Replace with actual patientId

    String? errorMessage = await api_edit_profile(
      patient_id: patientId,
      fullName: inputController.text,
      password: inputController1.text,
      email: emailController.text,
    );

    if (errorMessage == null) {
      // Profile edited successfully
      Get.snackbar('Success', 'Profile edited successfully');
    } else {
      // Display the error message to the user
      Get.snackbar('Error', errorMessage);
    }
  }
}
