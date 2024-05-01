import '../../../core/app_export.dart';
import '../models/all_articles_model.dart';

/// A controller class for the AllDoctorsScreen.
///
/// This class manages the state of the AllDoctorsScreen, including the
/// current allDoctorsModelObj
class AllArticlesController extends GetxController {
  Rx<AllArticlesModel> allArticlessModelObj = AllArticlesModel().obs;
}
