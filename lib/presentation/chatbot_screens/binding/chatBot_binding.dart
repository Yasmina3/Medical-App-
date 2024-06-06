import 'package:tabibak/presentation/chatbot_screens/controller/chat_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignUpScreen.
///
/// This class ensures that the SignUpController is created when the
/// SignUpScreen is first loaded.
class chatBotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => chatBotController());
  }
}
