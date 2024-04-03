import '../../../core/app_export.dart';
import '../models/choose_age_model.dart';

/// A controller class for the ChooseAgeScreen.
///
/// This class manages the state of the ChooseAgeScreen, including the
/// current chooseAgeModelObj
class ChooseAgeController extends GetxController {
  Rx<ChooseAgeModel> chooseAgeModelObj = ChooseAgeModel().obs;
}
