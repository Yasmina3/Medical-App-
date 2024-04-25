import '../../../core/app_export.dart';
import 'doctor_item_model.dart';

/// This class defines the variables used in the [home_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
  Rx<List<DoctorItemModel>> doctorItemList = Rx([
    DoctorItemModel(
        widget: ImageConstant.imgPexelsCedricF.obs,
        widget1: "طبيب نفسي".obs,
        fortySeven: "4,7".obs,
        widget2: ImageConstant.imgLinkedin.obs,
        eightHundred: "يبعد عنك 800م".obs,
        drMarcusHorizon: "Dr. Marcus Horizon".obs)
  ]);
}
