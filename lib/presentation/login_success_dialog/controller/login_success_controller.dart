import '../../../core/app_export.dart';
import '../models/login_success_model.dart';

/// A controller class for the LoginSuccessDialog.
///
/// This class manages the state of the LoginSuccessDialog, including the
/// current loginSuccessModelObj
class LoginSuccessController extends GetxController {
  Rx<LoginSuccessModel> loginSuccessModelObj = LoginSuccessModel().obs;
}
