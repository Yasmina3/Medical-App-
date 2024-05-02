import 'package:get/get.dart';

class UserController extends GetxController{
  var email = "".obs;
  var password = "".obs;
  var name = "".obs;
  var age = 0.obs;
  var gender = 0.obs;
  var height = 0.obs;
  var weight = 0.obs;
  var selected_Slot = 0.obs;
  var special_cases = ["1","1","1"].obs; // 1 tends for no , 2 tends for 2  implies  : allergy : No , Long-Term disease : Yes,  Rare disease : No

  static UserController get to => Get.find<UserController>(); // Add this line
  void saveState() {
    // Save the current state of all variables
    name.refresh();
    email.refresh();
    password.refresh();
    height.refresh();
    weight.refresh();
    gender.refresh();
    age.refresh();
    selected_Slot.refresh();
    special_cases.refresh();
    update();
  }
  void updateState(){
    update();
  }
}