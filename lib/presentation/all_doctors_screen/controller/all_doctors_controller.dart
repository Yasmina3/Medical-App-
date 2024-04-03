import '../../../core/app_export.dart';
import '../models/all_doctors_model.dart';

/// A controller class for the AllDoctorsScreen.
///
/// This class manages the state of the AllDoctorsScreen, including the
/// current allDoctorsModelObj
class AllDoctorsController extends GetxController {
  Rx<AllDoctorsModel> allDoctorsModelObj = AllDoctorsModel().obs;
}
