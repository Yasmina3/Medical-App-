import 'package:tabibak/presentation/suggestions_screen/controller/suggestions_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SuggestionsScreen.
///
/// This class ensures that the SuggestionsController is created when the
/// SuggestionsScreen is first loaded.
class SuggestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuggestionsController());
  }
}
