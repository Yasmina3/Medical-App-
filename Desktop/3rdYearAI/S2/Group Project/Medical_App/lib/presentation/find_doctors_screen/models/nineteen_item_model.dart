import '../../../core/app_export.dart';

/// This class is used in the [nineteen_item_widget] screen.
class NineteenItemModel {
  NineteenItemModel({
    this.nineteen,
    this.nineteen1,
    this.nineteen2,
    this.widget,
    this.widget1,
    this.widget2,
    this.id,
  }) {
    nineteen = nineteen ?? Rx(ImageConstant.imgSearch);
    nineteen1 = nineteen1 ?? Rx("كوفيد-19");
    nineteen2 = nineteen2 ?? Rx(ImageConstant.imgIconSyringe);
    widget = widget ?? Rx("جراح");
    widget1 = widget1 ?? Rx(ImageConstant.imgIconCardiologist);
    widget2 = widget2 ?? Rx("طبيب قلب");
    id = id ?? Rx("");
  }

  Rx<String>? nineteen;

  Rx<String>? nineteen1;

  Rx<String>? nineteen2;

  Rx<String>? widget;

  Rx<String>? widget1;

  Rx<String>? widget2;

  Rx<String>? id;
}
