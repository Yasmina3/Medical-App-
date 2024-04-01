import 'package:tabibak/presentation/popup_screen/controller/popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PopupScreen.
///
/// This class ensures that the PopupController is created when the
/// PopupScreen is first loaded.
class PopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopupController());
  }
}
