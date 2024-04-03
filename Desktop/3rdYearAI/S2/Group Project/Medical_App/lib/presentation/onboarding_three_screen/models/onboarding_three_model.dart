import 'headline1_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [onboarding_three_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingThreeModel {
  Rx<List<Headline1ItemModel>> headline1ItemList =
      Rx(List.generate(1, (index) => Headline1ItemModel()));
}
