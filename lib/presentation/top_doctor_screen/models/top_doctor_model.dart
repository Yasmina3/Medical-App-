import '../../../core/app_export.dart';
import 'fortyseven_item_model.dart';

/// This class defines the variables used in the [top_doctor_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TopDoctorModel {
  Rx<List<FortysevenItemModel>> fortysevenItemList = Rx([
    FortysevenItemModel(
        chardiologist: "Chardiologist".obs,
        chardiologist1: ImageConstant.imgSignal.obs,
        fortySeven: "4,7".obs,
        mdechezvous: ImageConstant.imgLinkedin.obs,
        distance: "800m de chez vous".obs,
        drMarcusHorizon: "Dr. Marcus Horizon".obs,
        drMarcusHorizon1: "Dr. Marcus Horizon".obs,
        widget: "طبيب نفسي".obs,
        chardiologist2: ImageConstant.imgSignal.obs,
        fortySeven1: "4,7".obs,
        widget1: ImageConstant.imgLinkedin.obs,
        eightHundred: "يبعد عنك 800م".obs,
        chardiologist3: ImageConstant.imgPexelsCedricF111x111.obs),
    FortysevenItemModel(
        chardiologist3: ImageConstant.imgPexelsThirdman5327580111x116.obs),
    FortysevenItemModel(chardiologist3: ImageConstant.img7xm6105x119.obs)
  ]);
}
