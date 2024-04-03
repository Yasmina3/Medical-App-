import '../../../core/app_export.dart';
import '../models/popupL_model.dart';

/// A controller class for the PopupScreen.
///
/// This class manages the state of the PopupScreen, including the
/// current popupModelObj
class PopupLController extends GetxController {
  Rx<PopupModel> popupModelObj = PopupModel().obs;
}
