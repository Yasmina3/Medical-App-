import '../../../core/app_export.dart';
import '../models/choose_gender_age_model.dart';

/// A controller class for the ChooseGenderAgeScreen.
///
/// This class manages the state of the ChooseGenderAgeScreen, including the
/// current chooseGenderAgeModelObj
class ChooseGenderAgeController extends GetxController {
  Rx<ChooseGenderAgeModel> chooseGenderAgeModelObj = ChooseGenderAgeModel().obs;
}
