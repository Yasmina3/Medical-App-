import 'package:get/get.dart';
import 'package:tabibak/presentation/searchresultscreen/controller/search_controller.dart';

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
