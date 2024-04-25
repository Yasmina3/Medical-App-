import 'package:tabibak/presentation/articles-screen/controller/all_articles_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AllDoctorsScreen.
///
/// This class ensures that the AllDoctorsController is created when the
/// AllDoctorsScreen is first loaded.
class AllArticlesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllArticlesController());
  }
}
