import '../../../core/app_export.dart';
import '../models/special_questions_model.dart';

/// A controller class for the SpecialQuestionsScreen.
///
/// This class manages the state of the SpecialQuestionsScreen, including the
/// current specialQuestionsModelObj
class SpecialQuestionsController extends GetxController {
  Rx<SpecialQuestionsModel> specialQuestionsModelObj =
      SpecialQuestionsModel().obs;

  Rx<String> radioGroup = "".obs;

  Rx<String> radioGroup1 = "".obs;
}
