import '../../../core/app_export.dart';
import 'fortyseven2_item_model.dart';

/// This class defines the variables used in the [all_doctors_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AllDoctorsModel {
  Rx<List<Fortyseven2ItemModel>> fortyseven2ItemList = Rx([]);
  AllDoctorsModel(){
      fortyseven2ItemList.value = [];
      }
}
