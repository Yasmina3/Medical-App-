import 'package:tabibak/presentation/done_screen/controller/done_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DoneScreen.
///
/// This class ensures that the DoneController is created when the
/// DoneScreen is first loaded.
class DoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoneController());
  }
}
