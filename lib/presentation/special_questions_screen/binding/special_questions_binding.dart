import 'package:tabibak/presentation/special_questions_screen/controller/special_questions_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SpecialQuestionsScreen.
///
/// This class ensures that the SpecialQuestionsController is created when the
/// SpecialQuestionsScreen is first loaded.
class SpecialQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpecialQuestionsController());
  }
}
