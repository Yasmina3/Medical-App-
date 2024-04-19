import '../../../core/app_export.dart';
import 'fortyseven1_item_model.dart';

/// This class defines the variables used in the [suggestions_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SuggestionsModel {
  Rx<List<Fortyseven1ItemModel>> fortyseven1ItemList = Rx([
    Fortyseven1ItemModel(
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
        mdechezvous1: ImageConstant.imgLinkedin.obs,
        distance1: "800m de chez vous".obs,
        chardiologist3: ImageConstant.imgPexelsCedricF111x111.obs),
    Fortyseven1ItemModel(
        chardiologist3: ImageConstant.imgPexelsThirdman5327580111x116.obs),
    Fortyseven1ItemModel(chardiologist3: ImageConstant.img7xm6105x119.obs)
  ]);
}
