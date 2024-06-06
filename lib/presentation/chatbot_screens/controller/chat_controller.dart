import '../../../core/app_export.dart';
import '../models/chatbot.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class chatBotController extends GetxController {
  Rx<chatBotModel> chatBotModelObj = chatBotModel().obs;
}
