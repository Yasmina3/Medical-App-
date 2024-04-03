import 'package:tabibak/presentation/choose_height_weight_screen/controller/choose_height_weight_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseHeightWeightScreen.
///
/// This class ensures that the ChooseHeightWeightController is created when the
/// ChooseHeightWeightScreen is first loaded.
class ChooseHeightWeightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseHeightWeightController());
  }
}
