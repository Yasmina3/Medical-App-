import '../../../core/app_export.dart';
import '../models/choose_height_weight_model.dart';

/// A controller class for the ChooseHeightWeightScreen.
///
/// This class manages the state of the ChooseHeightWeightScreen, including the
/// current chooseHeightWeightModelObj
class ChooseHeightWeightController extends GetxController {
  Rx<ChooseHeightWeightModel> chooseHeightWeightModelObj =
      ChooseHeightWeightModel().obs;
}
