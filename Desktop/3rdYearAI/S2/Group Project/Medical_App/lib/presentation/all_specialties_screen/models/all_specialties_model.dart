import '../../../core/app_export.dart';
import 'widget_item_model.dart';

/// This class defines the variables used in the [all_specialties_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AllSpecialtiesModel {
  Rx<List<WidgetItemModel>> widgetItemList = Rx([
    WidgetItemModel(
        widget: "طبيب أسنان".obs,
        twelveThousand: "أكثر من 12000 طبيب أسنان".obs,
        widget1: "الأقرب على بُعد 800 متر من موقعك".obs,
        widget2: ImageConstant.imgDentist.obs),
    WidgetItemModel(widget2: ImageConstant.imgIconLungs.obs)
  ]);
}
