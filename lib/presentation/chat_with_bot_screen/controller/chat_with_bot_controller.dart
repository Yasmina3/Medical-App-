import '../../../core/app_export.dart';
import '../models/chat_with_bot_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ChatWithBotScreen.
///
/// This class manages the state of the ChatWithBotScreen, including the
/// current chatWithBotModelObj
class ChatWithBotController extends GetxController {
  TextEditingController chatOneController = TextEditingController();

  TextEditingController typeMessageController = TextEditingController();

  Rx<ChatWithBotModel> chatWithBotModelObj = ChatWithBotModel().obs;

  @override
  void onClose() {
    super.onClose();
    chatOneController.dispose();
    typeMessageController.dispose();
  }
}
