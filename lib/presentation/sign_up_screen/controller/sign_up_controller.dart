import '../../../core/app_export.dart';
import '../models/sign_up_model.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
}
