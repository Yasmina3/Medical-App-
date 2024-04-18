import '../controller/all_doctors_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AllDoctorsScreen.
///
/// This class ensures that the AllDoctorsController is created when the
/// AllDoctorsScreen is first loaded.
class AllDoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllDoctorsController());
  }
}
