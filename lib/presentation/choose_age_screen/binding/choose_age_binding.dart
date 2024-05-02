import 'package:tabibak/presentation/choose_age_screen/controller/choose_age_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseAgeScreen.
///
/// This class ensures that the ChooseAgeController is created when the
/// ChooseAgeScreen is first loaded.
class ChooseAgeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseAgeController());
  }
}
