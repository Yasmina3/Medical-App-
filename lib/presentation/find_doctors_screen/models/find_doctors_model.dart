import '../../../core/app_export.dart';
import 'nineteen_item_model.dart';
import 'doctors_item_model.dart';

/// This class defines the variables used in the [find_doctors_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FindDoctorsModel {
  Rx<List<NineteenItemModel>> nineteenItemList = Rx([
    NineteenItemModel(
        nineteen: ImageConstant.imgSearch.obs,
        nineteen1: "كوفيد-19".obs,
        nineteen2: ImageConstant.imgIconSyringe.obs,
        widget: "جراح".obs,
        widget1: ImageConstant.imgIconCardiologist.obs,
        widget2: "طبيب قلب".obs)
  ]);

  Rx<List<DoctorsItemModel>> doctorsItemList = Rx([
    DoctorsItemModel(
        drMarcus: ImageConstant.imgPexelsCedricF64x64.obs,
        drMarcus1: "Dr. Marcus".obs),
    DoctorsItemModel(
        drMarcus: ImageConstant.imgPexelsEvelinaZhu543401964x64.obs,
        drMarcus1: "Dr. Maria".obs),
    DoctorsItemModel(
        drMarcus: ImageConstant.imgPexelsThirdman532758064x64.obs,
        drMarcus1: "Dr. Stevi".obs),
    DoctorsItemModel(
        drMarcus: ImageConstant.imgPexelsThirdman532765664x64.obs,
        drMarcus1: "Dr. Luke".obs)
  ]);
}
