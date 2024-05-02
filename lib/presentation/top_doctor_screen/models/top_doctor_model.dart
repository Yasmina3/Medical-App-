import '../../../core/app_export.dart';
import 'fortyseven_item_model.dart';

/// This class defines the variables used in the [top_doctor_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TopDoctorModel {
  Rx<List<FortysevenItemModel>> fortysevenItemList = Rx([
    FortysevenItemModel(
        drMarcusHorizon1: "أدوات طبية لمرضى السكري".obs,
        widget: " جهاز قياس نسبة السكر في الدم، وإبر الإنسولين، وأجهزة قياس ضغط الدم".obs,
        chardiologist3: ImageConstant.imgPexelsCedricF111x111.obs),
    FortysevenItemModel(
        chardiologist3: ImageConstant.imgPexelsThirdman5327580111x116.obs),
    FortysevenItemModel(chardiologist3: ImageConstant.img7xm6105x119.obs)
  ]);
}
