import 'package:mohamed_nadir_student_s_application5/presentation/onboarding_two_screen/controller/onboarding_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingTwoScreen.
///
/// This class ensures that the OnboardingTwoController is created when the
/// OnboardingTwoScreen is first loaded.
class OnboardingTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingTwoController());
  }
}
