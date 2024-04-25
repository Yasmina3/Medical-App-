import '../../../core/app_export.dart';

/// This class is used in the [widget_item_widget] screen.
class WidgetItemModel {
  WidgetItemModel({
    this.widget,
    this.twelveThousand,
    this.widget1,
    this.widget2,
    this.id,
  }) {
    widget = widget ?? Rx("طبيب أسنان");
    twelveThousand = twelveThousand ?? Rx("أكثر من 12000 طبيب أسنان");
    widget1 = widget1 ?? Rx("الأقرب على بُعد 800 متر من موقعك");
    widget2 = widget2 ?? Rx(ImageConstant.imgDentist);
    id = id ?? Rx(0);
  }

  Rx<String>? widget;

  Rx<String>? twelveThousand;

  Rx<String>? widget1;

  Rx<String>? widget2;

  Rx<int>? id;
}
