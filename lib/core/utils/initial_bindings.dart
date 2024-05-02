import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/data/apiClient/api_client.dart';
import 'package:tabibak/presentation/UserController.dart';
import 'package:tabibak/presentation/reservation_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(UserController());
    Get.put(TopController());
  }
}
