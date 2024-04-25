import '../../../core/app_export.dart';
import '../models/suggestions_model.dart';

/// A controller class for the SuggestionsScreen.
///
/// This class manages the state of the SuggestionsScreen, including the
/// current suggestionsModelObj
class SuggestionsController extends GetxController {
  Rx<SuggestionsModel> suggestionsModelObj = SuggestionsModel().obs;
}
