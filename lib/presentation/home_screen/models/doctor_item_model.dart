import '../../../core/app_export.dart';

/// This class is used in the [doctor_item_widget] screen.
class DoctorItemModel {
  DoctorItemModel({
    this.widget,
    this.widget1,
    this.fortySeven,
    this.widget2,
    this.eightHundred,
    this.drMarcusHorizon,
    this.id,
  }) {
    widget = widget ?? Rx(ImageConstant.imgPexelsCedricF);
    widget1 = widget1 ?? Rx("طبيب نفسي");
    fortySeven = fortySeven ?? Rx("4,7");
    widget2 = widget2 ?? Rx(ImageConstant.imgLinkedin);
    eightHundred = eightHundred ?? Rx("يبعد عنك 800م");
    drMarcusHorizon = drMarcusHorizon ?? Rx("Dr. Marcus Horizon");
    id = id ?? Rx("");
  }

  Rx<String>? widget;

  Rx<String>? widget1;

  Rx<String>? fortySeven;

  Rx<String>? widget2;

  Rx<String>? eightHundred;

  Rx<String>? drMarcusHorizon;

  Rx<String>? id;
}
