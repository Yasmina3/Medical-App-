import 'package:tabibak/presentation/choose_gender_age_screen/controller/choose_gender_age_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseGenderAgeScreen.
///
/// This class ensures that the ChooseGenderAgeController is created when the
/// ChooseGenderAgeScreen is first loaded.
class ChooseGenderAgeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseGenderAgeController());
  }
}
