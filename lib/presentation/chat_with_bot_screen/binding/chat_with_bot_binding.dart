import 'package:tabibak/presentation/chat_with_bot_screen/controller/chat_with_bot_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatWithBotScreen.
///
/// This class ensures that the ChatWithBotController is created when the
/// ChatWithBotScreen is first loaded.
class ChatWithBotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatWithBotController());
  }
}
