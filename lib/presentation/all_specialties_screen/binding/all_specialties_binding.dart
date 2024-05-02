import 'package:tabibak/presentation/all_specialties_screen/controller/all_specialties_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AllSpecialtiesScreen.
///
/// This class ensures that the AllSpecialtiesController is created when the
/// AllSpecialtiesScreen is first loaded.
class AllSpecialtiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllSpecialtiesController());
  }
}
