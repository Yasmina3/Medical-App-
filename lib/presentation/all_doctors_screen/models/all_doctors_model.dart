import '../../../core/app_export.dart';
import 'fortyseven2_item_model.dart';

/// This class defines the variables used in the [all_doctors_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AllDoctorsModel {
  Rx<List<Fortyseven2ItemModel>> fortyseven2ItemList = Rx([
    Fortyseven2ItemModel(
        drMarcusHorizon: "Dr. Marcus Horizon".obs,
        widget: "طبيب نفسي".obs,
        drMarcusHorizon1: ImageConstant.imgSignal.obs,
        fortySeven: "4,7".obs,
        mdechezvous: ImageConstant.imgLinkedin.obs,
        distance: "800m de chez vous".obs,
        drMarcusHorizon2: ImageConstant.imgPexelsCedricF111x111.obs),
    Fortyseven2ItemModel(
        drMarcusHorizon2: ImageConstant.imgPexelsThirdman53275801.obs),
    Fortyseven2ItemModel(drMarcusHorizon2: ImageConstant.img7xm61.obs),
    Fortyseven2ItemModel(drMarcusHorizon2: ImageConstant.imgPexelsAnthony.obs)
  ]);
}