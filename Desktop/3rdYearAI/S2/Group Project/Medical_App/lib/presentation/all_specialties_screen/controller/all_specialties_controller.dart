import '../../../core/app_export.dart';
import '../models/all_specialties_model.dart';

/// A controller class for the AllSpecialtiesScreen.
///
/// This class manages the state of the AllSpecialtiesScreen, including the
/// current allSpecialtiesModelObj
class AllSpecialtiesController extends GetxController {
  Rx<AllSpecialtiesModel> allSpecialtiesModelObj = AllSpecialtiesModel().obs;
}
