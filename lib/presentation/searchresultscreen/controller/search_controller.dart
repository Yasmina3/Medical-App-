import 'package:get/get.dart';
import 'package:tabibak/presentation/home_screen/models/doctor_item_model.dart';

class AllDoctorsController extends GetxController {
  RxList<DoctorItemModel> doctorsList = <DoctorItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void fetchDoctors() {
    // This method would fetch the doctors and update `doctorsList`
    // For now, let's assume doctorsList is filled somewhere else and ready to use
  }
}
