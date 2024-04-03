import '../../../core/app_export.dart';

/// This class is used in the [doctors_item_widget] screen.
class DoctorsItemModel {
  DoctorsItemModel({
    this.drMarcus,
    this.drMarcus1,
    this.id,
  }) {
    drMarcus = drMarcus ?? Rx(ImageConstant.imgPexelsCedricF64x64);
    drMarcus1 = drMarcus1 ?? Rx("Dr. Marcus");
    id = id ?? Rx("");
  }

  Rx<String>? drMarcus;

  Rx<String>? drMarcus1;

  Rx<String>? id;
}
