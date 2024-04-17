import '../../../core/app_export.dart';
import 'widget_item_model.dart';

class AllSpecialtiesModel {
  Rx<List<WidgetItemModel>> widgetItemList = Rx([]);
  AllSpecialtiesModel() {
    widgetItemList.value = [];
  }
}
/*
Rx<List<WidgetItemModel>> widgetItemList = Rx([
  WidgetItemModel(
      widget: "طبيب أسنان".obs,
      twelveThousand: "أكثر من 12000 طبيب أسنان".obs,
      widget1: "الأقرب على بُعد 800 متر من موقعك".obs,
      widget2: ImageConstant.imgIconDentist.obs),
  WidgetItemModel(
      widget: "طبيب قلب".obs,
      twelveThousand: "أكثر من 10000 طبيب قلب".obs,
      widget1: "الأقرب على بُعد 800 متر من موقعك".obs,
      widget2: ImageConstant.imgIconCardiologist.obs),
  WidgetItemModel(
      widget: "طبيب أمراض صدرية".obs,
      twelveThousand: "أكثر من 8000 طبيب أمراض صدرية".obs,
      widget1: "الأقرب على بُعد 800 متر من موقعك".obs,
      widget2: ImageConstant.imgIconLungs.obs),
  WidgetItemModel(
      widget: "طبيب عام".obs,
      twelveThousand: "أكثر من 5000 طبيب عام".obs,
      widget1: "الأقرب على بُعد 800 متر من موقعك".obs,
      widget2: ImageConstant.imgIconDoctor.obs),
]);

 */